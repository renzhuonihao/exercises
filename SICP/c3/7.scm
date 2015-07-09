(define (make-account  balance password) 
  (let ((ct 0)
	(max 2))  
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
    (define (call-the-cops)
      "You've try 7 times,the cops is coming!")
    (define (warning x)
      (display "Incorrect password")
      (set! ct (+ 1 ct))
      (if (>= ct max)
	  (call-the-cops)))

   
    (define (new-dispatch ps mou)
      (cond ((and (eq? ps 'get-pw) (eq? mou 'get-pw)) password)  ;;尼玛，费好大劲才想到怎么取出里面设定的密码,以及后面怎么确定密码正确与否
	    ((eq? ps password) (dispatch mou))                   ;;lisp的封装好严密啊
	    (else
	      warning)))
    new-dispatch))

(define (make-joint acc pw-o pw-n);此处make-joint调用一次，得创建一个对应的局部变量密码
  (if (eq? pw-o (acc 'get-pw 'get-pw))
      (lambda (pw mou)
	(cond ((and (eq? pw 'get-pw) (eq? mou 'get-pw)) pw-n);可以将新账户绑定到二级账户上
	      ((eq? pw pw-n) (acc pw-o mou))
	       (else
		(error "Please enter correct NEW password"))))
      (error "Please enter correct OLD password")))



;以下为测试内容
(define acc1 (make-account 100 'p1))
(define acc2 (make-joint acc1 'p1 'p2))
(define acc3 (make-joint acc2 'p2 'p3))
((acc3 'p3 'with-draw) 10)