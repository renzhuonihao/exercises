(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (horner-eval x coe-sq)
  (accumulate (lambda (this high) (+ this (* x high)))
              0
              coe-sq))
(define t-sq (list 1 3 0 5 0 1))
