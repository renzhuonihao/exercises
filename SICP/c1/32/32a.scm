(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      ((combiner (term a)
                 (accumulate combiner null-value term a next b)))))
(define (sum term a next b)
  (define (combiner a b)
    (+ a b))
  (define null-value 0)
  (accumulate combiner null-value term a next b))
(define (product term a next b)
  (define (combiner a b)
    (* a b))
  (define null-value 1)
  (accumulate combiner null-value term a next b))
;或者直接
;(define (sum term a next b)
;  (accumulate + 0 term a next b))
;(define (product term a next b)
;  (accumulate * 1 term a next b))
;不过感觉上面的那种比较好，因为如果需要构造的combiner过程不是基本过程，
;而是需要自定义的话，上面的形式比较通用，下面的这种情况写的简单，不通用
(define (factor b)
  (define (son k)
    (cond ((even? k) (+ k 2))
          (else (+ k 1))))
  (define (mother k)
    (cond ((even? k) (+ k 1))
          (else (+ k 2))))
  (define (term k)
    (/ (son k) (mother k)))
  (define (fa-next k)
    (+ 1 k))
  (product term 1.0 fa-next b))
(define (run-test)
  (display (* 4 (factor 10)))
  (newline)
  (display (* 4 (factor 100))))

;;发现一个比较尴尬的状况，抽象层次很高的话，很容易爆栈，这么小的数都内存用完
;;看来抽象层次稍微高一点，就得把他写成迭代计算过程，嗯，写一下试一试。