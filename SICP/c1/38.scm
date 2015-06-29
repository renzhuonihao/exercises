;用的迭代计算过程，因为递归计算过程写的太丑了 
(define (cont-frac n d k)
   (define (iter-cont-frac count product)
     (if (= count 0)
	 product
	 (iter-cont-frac (- count 1) (/ (n count) (+ (d count) product)))))
   (iter-cont-frac  k 0))
(define (cal-e)
  (define (cal-e-2)
    (define (d x)
      (let ((rem (remainder x 3)))
        (if (= rem 2)
            (+ (* (/ (- x rem) 3) 2) 2)
            1)))
    (cont-frac (lambda (x) 1)
               d
               50))
  (* 1.0 (+ 2 (cal-e-2))))
;最初的版本出了个bug，我还以为(/ 5 3)等于1呢，结果等于1又2/3，这scheme还有分数竟然。