(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) 
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))
(define (prime? n)
  (fast-prime? n 5))
;以上为检验一个数是不是素数

(define nil '())
(define (accumulate op ini sq)
  (if (null? sq)
      ini
      (op (car sq)
          (accumulate op ini (cdr sq)))))
(define (enumerate-interval l h)
  (if (> l h)
      nil
      (cons l (enumerate-interval (+ l 1) h))))
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))
(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap
                (lambda (i)
                  (map (lambda (j) (list i j))
                       (enumerate-interval 1 (- i 1))))
                (enumerate-interval 1 n)))))


;以下内容是40题的测试
(define (unique-pairs n)
  (flatmap
   (lambda (i)
     (map (lambda (j) (list i j))
          (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))
(define (prime-sum-pairs-my n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))


