(define nil '())
(define (deal pre? ls result)
    (cond ((null? ls) result)
          ((pre? (car ls))
           (deal pre? (cdr ls) (cons (car ls) result)))
          (else (deal pre? (cdr ls) result))))
;此处(car ls)可用let抽象一下貌似
(define (pick pre? ls)
  (reverse (deal pre? ls nil)))


(define (same-parity ls)
  (let ((this (car ls)))
    (if (odd? this)
        (pick odd? ls)
        (pick even? ls))))
(define test1 (list 1 2 3 4 5 6 7))
(define test2 (list 2 3 4 5 6 7))