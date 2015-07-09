(define (monte-carlo trials experiment)
  (define (iter trials-remaing trials-passed)
    (cond ((= trials-remaing 0)
	   (/ trials-passed trials))
	  ((experiment)
	   (iter (- trials-remaing 1) (+ 1 trials-passed)))
	  (else
	   (iter (- trials-remaing 1) trials-passed))))
  (iter trials 0))