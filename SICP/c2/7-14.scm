;;区间算数
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))))
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
	(p2 (* (lower-bound x) (upper-bound y)))
	(p3 (* (upper-bound x) (lower-bound y)))
	(p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))
(define (div-interval x y)
  (mul-interval x
		(make-interval (/ 1.0 (upper-bound y))
			       (/ 1.0 (lower-bound y)))))

;;练习2.7
;(define (make-interval a b) (cons a b))
;(define (upper-bound x) (cdr x))
;(define (lower-bound x) (car x))
;这个题做的有点问题，需要从新写一下


;练习2.7版本2
(define (make-interval a b) (cons a b))
(define (upper-bound x)
  (let ((p1 (car x))
        (p2 (cdr x)))
    (max p1 p2)))
(define (lower-bound x)
  (let ((p1 (car x))
        (p2 (cdr x)))
    (min p1 p2)))
;;用到了抽象屏障的知识，应该还有另一种写法，就是在构造函数那里将顺序定一下
  
  
  
  
;练习2.8
(define (sub-interval a b)
  (make-interval (- (lower-bound a) (upper-bound b))
		 (- (upper-bound a) (lower-bound b))))

(define (wide x)
  (/ (- (upper-bound x) (lower-bound x))
     2))

;练习2.10
(define (div-interval x y)
  (let ((low (lower-bound y))
        (up (upper-bound y)))
    (if (> (* low up) 0)
        (mul-interval x
                      (make-interval (/ 1.0 (upper-bound y))
                                     (/ 1.0 (lower-bound y))))
        (display "err:span 0"))))
;这里不太清楚，不知道报错怎么处理比较好，而且不知道这里用if好还是cond好
(define x1 (make-interval 2 3))
(define x2 (make-interval -2 3))
(define (run-test-10) (div-interval x1 x2))

;练习2.11
(define (mul-interval x y)
  (let ((lx (lower-bound x))
        (ly (lower-bound y))
        (ux (upper-bound x))
        (uy (upper-bound y)))
    (cond ((and (>= lx 0) (>= ux 0) (<= ly 0) (<= uy 0))
           (make-interval (*ux ly) (* lx uy)))
          ((and (>= lx 0) (>= ux 0) (<= ly 0) (>= uy 0))
           (make-interval (* ux ly) (* ux uy)))
          ((and (>= ux 0) (>= lx 0) (>= ly 0) (>= uy 0))
           (make-interval (* lx ly) (* ux uy)))
          ((and (<= ux 0) (<= lx 0) (<= ly 0) (<= uy 0))
           (make-interval (* ux uy) (* lx ly)))
          ((and (<= ux 0) (<= lx 0) (<= ly 0) (>= uy 0))
           (make-interval (* lx uy) (* lx ly)))
          ((and (<= lx 0) (<= ux 0) (>= ly 0) (>= uy 0))
          (mul-interval y x))
          ((and (<=  lx 0) (>= ux 0) (>= ly 0))
           (mul-interval y x))
          ((and (<= lx 0) (>= ux 0) (<= uy 0))
           (mul-interval y x))
          ((and (<= lx 0) (>= ux 0) (<= ly 0) (>= uy 0))
           (make-interval (min (* lx uy) (* ux ly))
                          (max (* lx ly) (* ux uy)))))))
;这个函数中间有一部分写的太繁琐了，如++可写为l>0即可的，写到半截才反应过来。


(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))
;这种写法是抽象屏障的又一次利用，构造加选择函数这种处理数据的方式真是好，scheme真是一门优秀的语言啊!
;额。。。好像搞错了，不清楚有没有用抽象屏障，需要再斟酌一下，看下后面的。


;练习2.12
(define (make-center-percent c p)
  (make-center-width c (* c (/ p 100))))
(define (percent i)
  (* (/ (width i) (center i)) 100))
;感觉这个题还在考察抽象屏障

;练习2.13，不会做，没看懂题是什么意思


(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))


;练习2.14
;先采用区间的形式
(define r1 (make-interval 6.12 7.48))
(define r2 (make-interval 4.465 4.935))
(par1 r1 r2)
(par2 r1 r2)

(define A/A (div-interval r1 r1))  ;A/A
(define A/B (div-interval r1 r2))  ;A/B

;再采用百分比的形式
(define r-1 (make-center-percent 6.8 10))
(define r-2 (make-center-percent 4.7 5))
(define p1 (par1 r-1 r-2))
(define p2 (par2 r-1 r-2))
(percent p1)
(percent p2)
;这个练习采用的数据是之前例子中给的，结果很明显
;这个程序抽象屏障做的不好