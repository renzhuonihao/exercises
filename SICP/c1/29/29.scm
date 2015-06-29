(define (cube x) (* x x x))
(define (sum term a next count n)
  (if (> count n)
      0
      (cond ((or (= count 0) (= count n)) (+ (term a)
                                             (sum term (next a) next (+ count 1) n)))
            ((even? count) (+ (* 2 (term a))
                                 (sum term (next a) next (+ count 1) n)))
            (else (+ (* 4 (term a))
                        (sum term (next a) next (+ count 1) n))))))
(define (sip f a b n)
  (define h (/ (- b a) n))
  (define (sip-next a) (+ a h))
  (define (sip-term a) (f a))
  (* (/ h 3)
     (sum sip-term a sip-next 0 n)))
(define (run-test)
  (display (sip cube 0 1.0 100))
  (newline)
  (display (sip cube 0 1.0 1000)))

;;这个版本写的不好，不应该在sum里动手脚，不通用了，需要再写一个版本
;而且不知道这个版本有没有错误，心里没底