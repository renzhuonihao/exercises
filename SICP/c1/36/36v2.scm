(define (average x y) (/ (+ x y) 2))
(define tolerance 0.0001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess step)
    (let ((next (f guess)))
      (cond ((close-enough? guess next) (display step) next)
            (else (display step) (display " ")(display guess) (newline) (try next (+ 1 step)))))) ;此处有改动，去掉了一组括号
  (try first-guess 1))
(define (run-test)
  (fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0))

;还是很奇怪，不知道为什么这么一改就行了，可能是cond的语法问题吧
;参照书中p12  不清楚为什么将"表达式的序列"用括号括起来就不行了
;这个问题记下来，以后知识面扩展了再回来看，可能跟后面的列表什么的有关系。