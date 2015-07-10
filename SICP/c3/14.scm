(define (mystery x)
  (define (loop x y)
    (if (null? x)
	y
	(let ((temp (cdr x)))
	  (set-cdr! x y)
	  (loop temp x))))
  (loop x '()))

(define v '(a b c d))
(define w (mystery v))

;我简直tmd就是个人肉解释器！
;考察car cdr set-cdr! set-car! 的理解。本质是对指针的操作。
;w 和 y是指向同一个位置的指针

;v是指向a开头的指针， mystery改变了列表，但v>x之后是局部状态
;故v指向的位置没变，仍指向a开头，但v值变成了（a）

;跟c里的指针还有点像