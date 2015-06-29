(define (make-mobile left right)
  (list left right))
;构造函数,来构造二叉活动体

(define (make-branch lth str)
  (list lth str))
;构造函数,构造分支

;a)
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (cadr mobile))   ;也可写为(car (cdr mobile))
;活动体的选择函数

(define (branch-length br)
  (car br))
(define (branch-structure br)
  (cadr br))
;分支的选择函数


;b)
(define (total-weight m-or-w)
  (if (not (pair? m-or-w))
      m-or-w
      (+ (total-weight (branch-structure (left-branch m-or-w)))
         (total-weight (branch-structure (right-branch m-or-w)))))) ;关于变量的命名，感觉将m-or-w换为structure貌似也不错
;递归计算过程，先不写迭代的。
;感觉写不出来完全的迭代计算过程阿，仍需要递归调用这个函数，写出来估计就跟27 28题中的情况差不多了。

;c)
(define (balance? str)
  (define (moment br)
    (* (branch-length br)
       (total-weight (branch-structure br))))
  (if (not (pair? str)) 
      #t
      (and (= (moment (left-branch str))
              (moment (right-branch str)))
           (balance? (branch-structure (left-branch str)))
           (balance? (branch-structure (right-branch str))))))
;突然发现我的编程能力有质变了...

;d)
;刁！