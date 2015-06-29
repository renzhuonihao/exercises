(define (square x) (* x x))

(define (f x y)
  ((lambda (a b)
           (+ (* x (square a))
              (* y b)
              (* a b)))
   (+ 1 (* x y)) (- 1 y)))

(define (fa x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))
(define (run-test)
  (display (f 2 3))
  (newline)
  (display (fa 2 3)))