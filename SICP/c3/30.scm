(define (ripple-carry-adder l-a l-b l-s c-last c-1)
  (define (iter a b s c-out)
    (cond ((> (length a) 1)
	   (let ((ra (cdr a))
		 (rb (cdr b))
		 (rs (cdr s))
		 (c-in (make-wire)))
	     (full-adder (car a) (car b) c-in (car s) c-out)
	     (iter ra rb rs c-in)))
	  ((= (length a) 1) (full-adder a b c-1 s c-out))
	  (else
	   'done)))
  (iter l-a l-b l-s c-last))

;只要把线连对就行，参照 half-adder.scm ，顺序的先后不影响，但会在不同的时间出现不同的值