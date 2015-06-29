(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))
(define (successive-merge sorted-pairs)
  (if (null? (cdr sort-pairs))
      (car sorted-pairs)
      (let ((this (make-code-tree (car sorted-pairs) (cadr sorted-pairs))))
        ;(adjoin-set this (cddr sorted-pairs)))))有点小问题,下一行是正确的
        (successive-merge (adjoin-set this (cddr sorted-pairs))))))