(define (cube x) (* x x x))
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
(define (sip f a b n)
  (sip-iter f a b 0 n))
(define (sip-iter f a b count n)
  (define h (/ (- b a) n))
  (define (sip-term a)
    (cond ((or (= count 0) (= count n)) (f a))
          ((even? count) (* 2 (f a)))
          (else (* 4 (f a)))))
  (define (sip-next a) (+ a h))
  (* (/ h 3)
     (sum sip-term a sip-next b)))
(define (run-test)
  (display (sip cube 0 1.0 100))
  (newline)
  (display (sip cube 0 1.0 1000)))

;;发现不在sum中修改还不太好弄.这个版本写的是错的
;原来我的参数设置错了,应该是k而不是a