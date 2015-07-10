(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))
(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)
(define z (make-cycle (list 'a 'b 'c)))


;SICP每个题都这么精髓。将序对或列表赋值给某变量，本质是将指向该序对的指针赋值
;给该变量，对该变量求值，可以理解为指针顺着链条依次将元素打印出来，直到遇到null或找不到
;下一个要打印的.应该和elisp里的解释是一致的

;下面的代码可以验证
(define l1 '(x y z))
(define l4 '(x y z))
(define l2 l1)
(define l3 (make-cycle l1))
;ok，对l2求值，如果之前说的是对的，则l2也是无限循环，否则打印别的结果


;脑洞一开，加了个l4，list或其语法糖衣生成列表，本质是用cons，而cons的定义参见SICP
;175页，是创建了一个新的。练习3.12是个考察对cons理解的很好的例子。