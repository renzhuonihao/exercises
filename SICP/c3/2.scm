(define (make-monitored f)
  (let ((counter 0))
    (lambda (x)
      (cond ((eq? x 'how-many-calls?) counter)
	    ((eq? x 'reset-count) 
	     (begin
	       (set! counter 0)
	       counter))
	    (else
	     (set! counter (+ 1 counter))
	     (f x))))))