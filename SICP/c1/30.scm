(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))
(define (cube x) (* x x x))
(define (sip f a b n)
  (define h (/ (- b a) n))
  (define (factor k)
    (cond ((or (= k 0) (= k n)) 1)
          ((even? k) 2)
          (else 4)))
  (define (sip-term k)
    (* (factor k)
       (f (+ a (* h k)))))
  (define (sip-next k)
    (+ k 1))
  (* (/ h 3)
     (sum sip-term 0 sip-next n)))
(define (run-test)
  (display (sip cube 0 1.0 100))
  (newline)
  (display (sip cube 0 1.0 1000))
  (newline)
  (display (sip cube 0 1.0 10000000)))