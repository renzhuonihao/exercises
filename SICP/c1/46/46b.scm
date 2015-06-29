(define (square x) (* x x))
(define tolerance 0.00001)
(define (average x y) (/ (+ x y) 2))

(define ((iterative-improve enough? improve) x)
  (if (enough? x)
      x
      ((iterative-improve enough? improve)
       (improve x))))
;相对来说这个版本的稍微好理解些。

(define (sqrt-iter f-guess x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) tolerance)) 
  (define (improve-guess guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve-guess) f-guess))
(define (my-sqrt x)
  (sqrt-iter 1.0 x))

(define (fixed-point f first-guess)
  (define (close-enough? guess)
    (< (abs (- guess (f guess))) tolerance))
  (define (improve-guess guess)
    (f guess))
  ((iterative-improve close-enough? improve-guess) first-guess))

(define (run-test)
  (display (my-sqrt 25))
  (newline)
  (display (fixed-point cos 1.0)))
