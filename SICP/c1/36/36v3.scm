;这个是需要的，没构造出平均阻尼的情况。
(define (average x y) (/ (+ x y) 2))
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess step)
    (let ((next (f guess)))
      (cond ((close-enough? guess next) (display step) next)
            (else (display step) (display " ")(display guess) (newline) (try next (+ 1 step)))))) ;此处有改动,去掉了一组括号
  (try first-guess 1))
(define (run-test)
  (fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0))
(define (run-test2)
  (fixed-point (lambda (x) (/ (+ x (/ (log 1000) (log x))) 2)) 2.0))
;这个是看答案做的，不是很理解，感觉不太爽，I don't konw why!,感觉是对照课本照猫画虎
;另外，两个display的位置可以调整一下，这方面不太熟悉。
;学完将"过程作为返回值"学完之后可能还要来个第四版本