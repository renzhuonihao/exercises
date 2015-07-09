(define (test num)
  (define x 10)
  (begin
    (set! x (+ x num))
    x))

;内部define是个赋值过程，跟其他几个效果不一样k
