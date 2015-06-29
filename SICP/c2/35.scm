(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
;后面那个map没看懂什么意思，明天看下答案把，唉


(define (count-leaves tree)
    (accumulate +
                0
                (map (lambda (sub-tree)
                         (if (pair? sub-tree)           ; 如果这个节点有分支
                             (count-leaves sub-tree)    ; 那么这个节点调用 count-leaves 的结果就是这个节点的树叶数量
                             1))                        ; 遇上一个叶子节点就返回 1
                     tree)))
;这个题真是有点莫名其妙，感觉跟这节没什么关系啊，上面的是答案的版本，我的把null的情况也加进去了