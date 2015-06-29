;迭代版本
(define nil '())
(define (fringe ls)
  (define (i-f ls result)
    (cond ((null? ls) result)
          ((pair? (car ls)) (i-f (cdr ls)
                                 (append result (fringe (car ls)))))
          (else (i-f (cdr ls)
                     (append result
                             (list (car ls)))))))
  (i-f ls nil))
(define x (list (list 1 2) (list 3 4)))
(define xx (list x x))