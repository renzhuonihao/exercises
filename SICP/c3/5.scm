(load "monte-carlo.scm")
(define (bb x) (* x x))
(define (estimate-pi trials)
  (* (monte-carlo trials in?) 4))
(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))
(define (in?)
  (<= (apply + (map bb (list (- (random-in-range 2.0 8.0) 5) 
			     (- (random-in-range 4.0 10.0) 7))))
      9))


;此处注意，in？两边要加括号，否则得到的是真或假的值，而不是
;得到返回值为真假的过程。对 estimate-pi 求值后，显示#f is not
;appliable