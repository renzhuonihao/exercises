 (define (cont-frac n d k)
   (define (iter-cont-frac count product)
     (if (= count 0)
	 product
	 (iter-cont-frac (- count 1) (/ (n count) (+ (d count) product)))))
   (iter-cont-frac  k 0))
(define (tan-cf x k)
  (define (n m)
    (if (= 1 m)
	x
	(- (* x x))))
  (cont-frac n (lambda (x) (- (* x 2) 1)) k))
(define (run-test)
  (define (test x)
    (display "test")
    (display x)
    (display ":")
    (let ((tor 0.0001))
      (if (< (abs (- (tan x) (tan-cf x 100))) tor)
          (display "well!")
          (display "not enough!")))
    (newline))
  (test 32.0)
  (test 10.0))