(define nil '())
(define (reverse3 ls)
  (define (iter-rev ls result)
    (if (null? ls)
        result
        (iter-rev (cdr ls)
                  (cons (car ls)
                        result))))
  (iter-rev ls nil))
;哎呀卧槽,这么直观的想法刚开始没想到,后面再看才写出来
(define x (list 1 2 3 4  4))
