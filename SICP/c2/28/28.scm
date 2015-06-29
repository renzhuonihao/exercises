;递归版本
(define nil '())
(define (fringe ls)
  (cond ((null? ls) nil)
        ((pair? (car ls)) (append (fringe (car ls))
                                  (fringe (cdr ls))))
        (else (cons (car ls)
                    (fringe (cdr ls))))))
(define x (list (list 1 2) (list 3 4)))
(define xx (list x x))

;答案的边界限定条件不一样,感觉答案的更好点 
;更多内容,参照笔记本