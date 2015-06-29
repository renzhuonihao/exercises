(define nil '())
(define (accumulate op ini sq)
  (if (null? sq)
      ini
      (op (car sq)
          (accumulate op ini (cdr sq)))))
(define (enumerate-interval l h)
  (if (> l h)
      nil
      (cons l (enumerate-interval (+ l 1) h))))
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
(define (filter pre seq)
  (cond ((null? seq) nil)
        ((pre (car seq))
         (cons (car seq)
               (filter pre (cdr seq))))
        (else (filter pre (cdr seq)))))
(define (remove item seq)
  (filter (lambda (x) (not (= x item)))
          seq))
;唉，发现越到后面还是感觉mit-scheme好用


(define (comb x y)
  (and x y))   ;这里很奇怪，用直接用and不行，还得这么设置一下才可以
(define (safe? k positions)
  (define (pl i sq)
    (if (null? sq)
        '()
        (cons (+ (car sq) i)
              (pl ((if (> i 0) + -) i 1) (cdr sq)))))
  (define (row-safe? sq)
    (let ((this (car sq)))
      (accumulate comb
                  #t
                  (map (lambda (x) (not (= x this)))
                       (cdr sq)))))
  (define (diag sq i)
    (cons (car sq)
          (pl i (cdr sq))))
  (and (row-safe? positions)
       (row-safe? (diag positions 1))
       (row-safe? (diag positions -1))))
  
(define (queens board-size)
    (define (queen-cols k)
      (define (adjoin-position n-r k r-o-q)
        (cons n-r r-o-q)) ;由于这里的原因，需要将结果reverse一下才可以。刚开始是按照顺序处理，发现会十分麻烦
      (if (= k 0)
          (list nil)
          (filter
           (lambda (positions) (safe? k positions))
           (flatmap
            (lambda (rest-of-queens)
              (map (lambda (new-row)
                     (adjoin-position new-row k rest-of-queens))
                   (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
  (queen-cols board-size))