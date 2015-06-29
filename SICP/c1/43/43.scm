(define (compose f g)
  (lambda (x) (f (g x))))
(define (square x) (* x x))
(define (inc x) (+ 1 x))
(define (repeated f times)
  (if (= times 1)
      f
      (compose f (repeated f (- times 1)))))
(define (run-test)
  (display ((repeated square 2) 5))
  (newline)
  (display ((repeated inc 4) 7)))

;这里应该属于递归计算过程，试着用迭代计算过程写一下