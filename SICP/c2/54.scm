(define (my-equal1? a b)
  (cond ((and (null? a) (null? b)) #t)
        ((or (not (pair? a)) (not (pair? b))) (eq? a b))
        (else
         (and (my-equal1? (car a) (car b))
              (my-equal1? (cdr a) (cdr b))))))
(define (my-equal2? a b)
  (cond ((and (null? a) (null? b)) #t)
        ((and (pair? a) (pair? b))
         (and (my-equal2? (car a) (car b))
              (my-equal2? (cdr a) (cdr b))))
        (else (eq? a b))))
;感觉书上的描述不太好啊，自己写的感觉还不错