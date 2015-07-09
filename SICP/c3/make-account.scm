(define (make-account balance)
  (define (with-draw amount)
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'with-draw) with-draw)
	  ((eq? m 'deposit) deposit)
	  (else (error "Uknown request -- MAKE-ACCOUNT"
		       m))))
  dispatch)

;用到了消息传递