(define nil '())

;直接定义
(define (square-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

;使用map和递归定义
(define (square-tree2 tree)
  (map (lambda (sub-tree)
         (if (not (pair? sub-tree))
             (* sub-tree sub-tree)
             (square-tree2 sub-tree)))
       tree))
(define test (list 1
                   (list 2 (list 3 4) 5)
                   (list 6 7)))