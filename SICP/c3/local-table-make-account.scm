;版本一
(define (make-account)
  (let ((balance 100))
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
    dispatch))

;版本二
(define make-account-2
  (let ((balance 100))
    (lambda ()
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
  dispatch)))



;版本一和版本二 的两中写法又很大差异，注意此处的区别。