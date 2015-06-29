(define nil '())
(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda(x) (append (list (car s)) x))
                          rest)))))
(define x (list 1 2 3))
(define y (list 1 2 3 4))
;一个奇怪的 地方名为什么我以前用类似的方式写过let
;怎么不行啊！

;答案用的是(map (lambda(x) (cons (car s) x))
;还有种等价写法(map (lambda(x) (append (list (car s)) x)，这样就跟题目中的顺序一样了 
;我竟然看了半天才发现是可行的，对这块还是不熟悉啊 另外见课本67页的例子