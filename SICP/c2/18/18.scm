(define nil '())

(define (reverse1 ls)
  (if (null? ls)
      nil
      (append (reverse1 (cdr ls))
              (list (car ls)))))

(define (reverse2 ls)
  (define (rev ls result)
    (if (null? (cdr ls))
        (append ls result)
        (rev (cdr ls) (append (list (car ls))
                              result))))
  (rev ls nil))
;写这个程序的时候没考虑27题的情况,不过结果还是对的.网上的人用的时cons
;做的，算了，还是不想那么多了,不过要修改这个改到27那种，感觉还是 有点难度，换个思路试一下

(define test (list 233 21 3 12 3 21  4 1312 ))
(define (run-test)
  (display "r1   ")
  (reverse1 test)
  (newline)
  (display "r2   ")
  (reverse2 test))
;这块出现了个很奇怪的问题,r1的结果不显示,原因可能是p8.