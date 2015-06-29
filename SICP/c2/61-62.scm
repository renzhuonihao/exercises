(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((= x (car set)) #t)
        ((< x (car set)) #f)
        (else (element-of-set? x (cdr set)))))
(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)	    
               (cons x1
                     (intersection-set (cdr set1)
                                       (cdr set2))))
              ((< x1 x2)
               (intersection-set (cdr set1) set2))
              ((> x1 x2)
               (intersection-set set1 (cdr set2)))))))
;61写成排序的吧，要不然太简单了，我都不好意思  答案上提供了另一种实现，貌似也不错
(define (adjoin-set x set)
  (if (null? set)
      (list x)
      (let ((f (car set)))
        (cond ((< f x)
               (cons f (adjoin-set x (cdr set))))
              ((= f x) set)
              ((> f x) (cons x set))))))

;62
(define (union-set set1 set2)
  (cond ((null? set2) set1)
        ((null? set1) set2)
        (else           ;这里不加else直接用let貌似是不行的，因为可能对其遇到的第一个式子进行判定是真是假，结果遇到的是个let表达式
         (let ((x1 (car set1)) (x2 (car set2)) (r1 (cdr set1)) (r2 (cdr set2)))
           (cond ((= x1 x2)
                  (cons x1 (union-set r1 r2)))
                 ((< x1 x2)
                  (append (list x1 x2) (union-set r1 r2)))
                 ((> x1 x2)
                  (append (list x2 x1) (union-set r1 r2))))))))
;进一步加深了对let的理解，不清楚let写在其他的判定语句(如本例中前两个(null? set2)等)之后可不可以。不过那样的话let的作用范围就很小了
;上面这个程序是有bug的，虽然也通过这个程序学到不少东西



;62再写一遍
(define (union-set set1 set2)
  (cond ((null? set2) set1)
        ((null? set1) set2)
        (else          
         (let ((x1 (car set1)) (x2 (car set2)) (r1 (cdr set1)) (r2 (cdr set2)))
           (cond ((= x1 x2)
                  (cons x1 (union-set r1 r2)))
                 ((< x1 x2)
                  (cons x1 (union-set r1 set2)))
                 ((> x1 x2)
                  (cons x2 (union-set set1 r2))))))))
;唉，第一遍写完竟然没发现自己写的是有bug的！