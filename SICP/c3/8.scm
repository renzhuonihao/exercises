(define (f x)
  (let ((ct 0)
	(pt 0))
    (begin
      (set! pt (+ ct pt))
      (if (= x 1)
	  (set! ct 1)
	  (display "x is not 1"))
      pt)))

;受不了了，为什么不行啊 ！！！