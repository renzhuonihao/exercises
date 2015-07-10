(define f
  (let ((ct 0)
	(pt 0))
    (lambda (x)
      (begin
	(set! pt (+ ct pt))
	(if (= x 1)
	    (set! ct 1)
	    (display "x is not 1"))
	pt))))

;受不了了，为什么不行啊 ！！！


;我日，过了这么多天了，终于知道哪里出问题了。此处，将f写成这种形式是会得到预期的效果。但是
;改成形式参数的形式就没了，跟draw-bal.scm有着类似的情况，目前还不清楚是为什么。