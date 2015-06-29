(define (filtered-accumulate combiner null-value term a next b predicate?)
  (define (iter result a)
    (cond ((> a b) result)
          ((predicate? a) (iter (combiner (term a) result) (next a)))
          (else (iter result (next a)))))
  (iter null-value a))
(define (sum-prime a b)
  (define (inc a) (+ 1 a))
  (define (sum-term a) a)
  (filtered-accumulate + 0 sum-term a inc b prime?))
(define (mul-prime a b)
  (define (mul-term a) a)
  (define (inc a) (+ 1 a))
  (define (to-be-muled? a)
    (= (gcd a b) 1))
  (filtered-accumulate * 1 mul-term a inc b to-be-muled?))
(define (m-p n)
  (mul-prime 1 n))

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))
(define (square x) (* x x))
(define (prime? n)
  (= n (smallest-divisor n)))

(define (run-test)
  (display (m-p 10))
  (newline)
  (display (sum-prime 1 10)))