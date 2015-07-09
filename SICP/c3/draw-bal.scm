;;版本一
(define balance 100)
(define (with-draw amount)
  (if (>= balance amount)
      (begin (set! balance (- balance amount))
	     balance)
      "Insufficient funds"))


(define new-withdraw
  (let ((balance 100))
  (lambda (amount)
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"Insufficient funds"))))

;new-withdraw和版本一运行效果是一样的，出乎意料
;
;这里对let以及lambda有了新的认识，想起来，let只是lambda的语法
;外衣，可以完美转换，但代换模型在此处已经不合适了
;
;lambda只是创建局部变量，没有赋值的作用貌似
;
