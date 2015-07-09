(define (make-accumulator origin)
  (lambda (number)
    (begin (set! origin (+ origin number))
	   origin)))

;begin表达式可选用，此处用上作为练习