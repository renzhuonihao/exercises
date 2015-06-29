(define (pow x n)
  (define (iter result count)
    (if (= count n)
        result
        (iter (* result x) (+ count 1))))
  (iter 1 0))
;这个过程写的不太好，貌似没用到 不变量，以后注意，
;迭代计算过程尽量用到不变量，对于确定计算过程的正确性还是很重要的

(define (my-cons a b)
  (* (pow 2 a) (pow 3 b)))
(define (my-car z)
  (define (iter x result)
    (let ((rem (remainder x 2)))
      (if (= rem 0)
          (iter (/ x 2) (+ result 1))
          result)))
  (iter z 0))
(define (my-cdr z)
  (define (iter x result)
    (let ((rem (remainder x 3)))
      (if (= rem 0)
          (iter (/ x 3) (+ result 1))
          result)))
  (iter z 0))

;程序还有很多需要优化的地方：快速求幂的函数
;另外可以在两个选择函数的基础上做一个更高级的抽象，显得更牛逼一点，但我没做