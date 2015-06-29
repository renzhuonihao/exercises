;递归计算版本
(define nil '())

;(define (deal pre? ls)
;  (cond ((null? ls) nil)
;        (let ((this (car ls))
;              (remind (cdr ls)))
;          ((pre? this)
;           (cons this (deal pre? remind)))
;          (else (deal pre? remind)))))
;这么写，显示 let: bad syntax in: let，看来最好还是别这么写


;(define (deal pre? ls)
;  (let ((this (car ls))
;        (remind (cdr ls)))
;    (cond ((null? ls) nil)
;          ((pre? this)
;           (cons this (deal pre? remind)))
;          (else (deal pre? remind)))))
;这么写果然会出问题，ls为空的时候仍然会执行(car ls)的操作


(define (deal pre? ls)
  (let ((this (car ls))
        (remind (cdr ls)))
    (cond ((null? remind) ls)
          ((pre? this)
           (cons this (deal pre? remind)))
          (else (deal pre? remind)))))
;这么写仍然有缺陷，ls为nil时候，会出错，另外，最后一个处理的有问题
;算了，还是别用let了，直接写吧。。。

(define (same-parity ls)
  (if (odd? (car ls))
      (deal odd? ls)
      (deal even? ls)))
(define t1 (list 1 2 3 4 5 6 7))
(define t2 (list 2 3 4  5 6 7))
