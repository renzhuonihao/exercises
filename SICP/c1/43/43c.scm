(define (compose f g)
  (lambda (x) (f (g x))))
(define (square x) (* x x))
(define (inc x) (+ 1 x))
(define (repeated f times)
  (define (iter result count)
    (if (= count times)
	result
	(iter (compose f result) (+ count 1))))
  (iter f 1))
(define (run-test)
  (display ((repeated square 2) 5))
  (newline)
  (display ((repeated inc 4) 7)))

;写到这里，在网上还见到一种写法，用到了41中的double，
;那人意思是说貌似可以达到O(logn)复杂度，没试过，以后有兴趣了在试一试吧