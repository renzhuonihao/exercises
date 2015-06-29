(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2)))

(define (repeated f n)
  (if (= n 0)
      f
      (average-damp (repeated f (- n 1))))) ;这个是递归版本，应该还有迭代版本，没写
;(define (4re x)
;  (fixed-point (repeated (lambda (y) (/ x (* y y y))) 2) 1.0))
;求四次方的根，一次平均阻尼是不够的，至少得两次
(define (pow x n)
  (define (iter result count)
    (if (= count n)
        result
        (iter (* result x) (+ count 1))))
  (iter 1 0))
(define (root-of x n)
  (lambda (y) (/ x (pow y (- n 1)))))

(define (test n-sq times x)
  (fixed-point (repeated (root-of x n-sq) times) 1.0)) ;辅助过程，用来发现规律
(define (judge n)
  (define (iter result now)
    (if (< now 0)
        (- result 1)
        (iter (+ 1 result) (- now (pow 2 result)))))
  (iter 0 n))   ;;这个过程写的真是太丑了，不过影响不大
(define (root-of-nsq n-sq x)
  (fixed-point (repeated (root-of x n-sq) (judge n-sq)) 1.0))