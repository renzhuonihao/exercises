;未改动  效率降低了
(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))
;效率提高
(define (adjoin-set x set)
  (cons x set))

;未改动  效率降低
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

;效率提高
(define (union-set a b)
  (append a b))

;哪个效率高就用哪个  跟答案有出入，不过感觉我的也对着呢