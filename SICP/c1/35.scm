(define (average x y) (/ (+ x y) 2))
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
(define (run-test)
  (display (fixed-point cos 1.0))
  (newline)
  (display (fixed-point (lambda (y) (+(sin y) (cos y))) 1.0)))
(define (sqrt-my x)
  (fixed-point (lambda (y) (/ x y)) 1.0))
(define (sqrt-my2 x)
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))
(define (run-test2)
  (newline)
  (display (sqrt-my2 321))
  (newline)
  (display (sqrt-my 321)))
(define (1-35)
  (display (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)))