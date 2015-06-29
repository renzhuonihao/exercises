;(define (my-for-each pro ls)
;  (cond ((null? ls) #t)
;        (else
;         ((pro (car ls)) (my-for-each pro (cdr ls))))))
;这版出bug了， application: not a procedure，程序把(pro (car ls))当成一个过程应用于之后的(my-for-each pro (cdr ls)
;之前对cond的理解有误，貌似把第四行去掉一层括号就可以了

(define (my-for-each pro ls)
  (cond ((null? ls)  (newline) #t);此处加 的(newline)试验下自己对cond的理解
        (else
         (pro (car ls)) (my-for-each pro (cdr ls)))))

(define pp 
  (lambda (x) (newline) (display x)))