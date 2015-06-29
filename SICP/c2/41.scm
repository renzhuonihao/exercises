(define nil '())
(define (filter pre seq)
  (cond ((null? seq) nil)
        ((pre (car seq))
         (cons (car seq)
               (filter pre (cdr seq))))
        (else (filter pre (cdr seq)))))
(define (accumulate op ini sq)
  (if (null? sq)
      ini
      (op (car sq)
          (accumulate op ini (cdr sq)))))
(define (enumerate-interval l h)
  (if (> l h)
      nil
      (cons l (enumerate-interval (+ l 1) h))))
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
(define (remove item seq)
  (filter (lambda (x) (not (= x item)))
          seq))
(define (enum-triples n)
  (define (enum-doubles seq);需要说明一下，double与trple参数类型不一致，设计问题
    (flatmap (lambda (j)
               (map (lambda (k) (list j k))
                    (remove j seq)))
             seq))
  (define s (enumerate-interval 1 n))
  (flatmap (lambda (i)
         (map (lambda (doubles) (cons i doubles))
              (enum-doubles (remove i s))))
       s))

(define (ans n s)
  (define (eq? triple)
    (let ((sum (accumulate + 0 triple)))
      (= s sum)))
  (filter eq?
          (enum-triples n)))

;该程序主要是帮助深入理解这一小结的内容，
;这个程序还有另一种写法，写出合为s的所有种类（无序的），然后再（permutation s）即可。
;这样小节后一部分的内容就用上了



;以下内容为对permutation的测试
(define (permutations s)
  (if (null? s)
      (list nil)
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))