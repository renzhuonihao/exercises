(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))
(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
	'()
	(let ((next-branch 
	       (choose-branch (car bits) current-branch)))
	  (if (leaf? next-branch)
	      (cons (symbol-leaf next-branch)
		    (decode-1 (cdr bits) tree))
	      (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))
(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
	((= bit 1) (right-branch branch))
	(else (error "bad bit -- CHOOSE-BRANCH"))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
	((< (weight x) (weight (car set))) (cons x set))
	(else (cons (car set)
		    (adjoin-set x (cdr set))))))
(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
	(adjoin-set (make-leaf (car pair)
			       (cadr pair))
		    (make-leaf-set (cdr pairs))))))

;67
(define sample-tree
  (make-code-tree (make-leaf 'A 4)
		  (make-code-tree
		   (make-leaf 'B 2)
		   (make-code-tree (make-leaf 'D 1)
				   (make-leaf 'C 1)))))
(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

;68的实验
(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))
(define (encode-symbol symbol tree)
  (define (find x tree)
    (if (leaf? tree)
        '()
        (let ((lb (left-branch tree)) (rb (right-branch tree)))
          (let ((ls (symbols lb)) (rs (symbols rb)))
            (if (element-of-set? x ls)
                (cons 0 (find x lb))
                (cons 1 (find x rb)))))))
  (if (element-of-set? symbol (symbols tree))
      (find symbol tree)
      (error "this symbol is not in the tree")))
;racket没有error,自己先定义一个,凑合着用
(define (error x)
  (display x))

;69
(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))
(define (successive-merge sorted-pairs)
  (if (null? (cdr sorted-pairs))
      (car sorted-pairs)
      (let ((this (make-code-tree (car sorted-pairs) (cadr sorted-pairs))))
        ;(adjoin-set this (cddr sorted-pairs)))))有点小问题,下一行是正确的
        (successive-merge (adjoin-set this (cddr sorted-pairs))))))

;70
(define tree (generate-huffman-tree '((A 1) (NA 16) (BOOM 1) (SHA 3) (GET 2) (YIP 9) (JOB 2) (WAH 1))))
;这个比较easy，肯定要节省很多

;71最频繁的一个，最不频繁的n个

;72 
;将element-of-set当成1的话跟答案一样，把自己写的那几个中间过程算进去的话就不太一样了
