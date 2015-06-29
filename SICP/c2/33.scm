(define test (list 1 2 3 4 5))
(define nil '())
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (my-map p seq)
  (accumulate (lambda (x y) (cons (p x) y))
              nil
              seq))
(define (my-append seq1 seq2)
  (accumulate cons seq2 seq1))
(define (my-length sq)
  (accumulate (lambda (x y) (+ 1 y)) 0 sq))

;这个累加器真是太强大了，题是做出来了，不过总有种是凑
;出来的感觉，累加器这块还得深入了解了，还得好好想一想