(define (double pro)         
  (lambda (x) (pro (pro x))))
(define (inc x)      
  (+ 1 x))
(((double (double double)) inc) 5)
;;总感觉怪怪的，不知道什么地方出了点问题。还是理解的不透彻。



;我看网上答案也是这样的，不过总感觉怪怪的，不知道什么地方
;而且很难在纸上推演，真是诡异啊！不太好理解

;应该是对的