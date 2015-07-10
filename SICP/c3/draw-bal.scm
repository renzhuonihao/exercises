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
(define (new-withdraw1 amount) 
  (let ((balance 100))
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"Insufficient funds")))



;又有了神奇的发现，在做习题8时除了点问题。发现 new-withdraw形式改成
;形式参数的形式就不存在这种出人意料的特性了。目前还不清楚原因。