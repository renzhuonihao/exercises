(define (unique-pairs n)
  (flatmap
   (lambda (i)
     (map (lambda (j) (list i j))
          (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))
;由于不是用的mit-scheme，不知道怎么载入其他程序，所以测试部分在tested-map.scm中