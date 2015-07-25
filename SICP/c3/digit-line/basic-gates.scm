(load "agenda.scm")
(load "wire.scm")
(define (after-delay delay action)
  (add-to-agenda! (+ delay (current-time the-agenda))
		  action
		  the-agenda))
;非门
(define (logical-not s)
  (cond ((= s 0) 1)
	((= s 1) 0)
	(else (error "Invalid signal" s))))
(define (inverter input output)
  (define (invert-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay inverter-delay 
		   (lambda ()
		     (set-signal! output new-value)))))
  (add-action! input invert-input)
  'connect-invert-ok)

;与门
(define (logical-and s1 s2)
  (cond ((and (= s1 1) (= s2 1)) 1)
	(else 0)))           ;得斟酌一下，不过不着急，以后修改也可以
(define (and-gate a1 a2 output)
  (define (add-action-procedure)
    (let ((new-value
	   (logical-and (get-signal a1) (get-signal a2))))
      (after-delay and-gate-delay
		   (lambda ()
		     (set-signal! output new-value)))))
  (add-action! a1 add-action-procedure)
  (add-action! a2 add-action-procedure)
  'connect-and-ok)

;或门
(define (logical-or s1 s2)
  (cond ((or (= s1 1) (= s2 1)) 1)
	(else 0))) ;同 logical-and
(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value
	   (logical-or (get-signal a1) (get-signal a2))))
      (after-delay or-gate-delay
		   (lambda ()
		     (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  'connect-or-ok)