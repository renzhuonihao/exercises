(define average-damp
  (lambda (f) (lambda (x) (average x (f x)))))
(define (average x y)
  (/ (+ x y) 2))
(define (square x) (* x x))
((average-damp square) 10)
