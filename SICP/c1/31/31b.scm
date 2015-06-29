(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))
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
  (display (* 4 (factor 10000)))
  (newline)
  (display (* 4 (factor 100000))))