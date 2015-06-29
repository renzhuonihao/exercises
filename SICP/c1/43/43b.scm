(define (compose f g)
  (lambda (x) (f (g x))))
(define (square x) (* x x))
(define (inc x) (+ 1 x))
(define (repeated f times)
  (define (iter result count)
    (if (= count times)
	result
	(iter (compose f result) (+ count 1))))
  (iter (lambda (x) x) 0))  ;;这个初始值设置的不是很有把握
(define (run-test)
  (display ((repeated square 2) 5))
  (newline)
  (display ((repeated inc 4) 7)))
