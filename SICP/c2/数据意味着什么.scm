;真是tmd太神奇了！
(define (my-cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Argument not 0 or 1 -- CONS" m))))
  dispatch)
(define (my-car z) (z 0))
(define (my-cdr z) (z 1))