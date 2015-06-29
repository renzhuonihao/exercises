(define test-list (list 32 432  42 2 31  4 32 132 321 312 ))

(define (last-pair1 items)
  (define nil '())
  (let ((last (list-ref items
                        (- (length items)
                           1))))
    (cons last nil)))
;真是一种丑到爆的写法


(define (last-pair2 ls)
  (if (null? ls)
      #f
      (if (null? (cdr ls))
          ls
          (last-pair2 (cdr ls)))))
;这个方法是可行的,网上用的是cond