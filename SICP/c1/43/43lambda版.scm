(define (repeated f n)
  (if (= n 1)
      f
      (lambda (x) (f ((repeated f (- n 1)) x)))))
;递归版

(define (repeated f n)
  (define (iter count result)
    (if (= count n)
        result
        (iter (+ count 1) (lambda (x) (f (result x))))))
  (iter 1 f));或者(iter 0 (lambda (x) x)
;跌代版

;但如何将smooth与compose带入好像不太好理解...有点错乱
