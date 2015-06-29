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
;racket没有error，自己先定义一个，凑合着用
(define (error x)
  (display x))

;如果符号很多的话，可以挑一些频率高的把它的编码跟符号先弄出来组成一个集合,
;这样的话先从那个集合中查找，查不到再调用encode-symbol过程
;不过这个集合用什么数据结构还没想清楚,这样的话效率应该会有所提升吧