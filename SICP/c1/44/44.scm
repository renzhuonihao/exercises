(define dx 0.0000001)
(define (smooth f)
  (lambda (x) (/ (+ (f (+ x dx))
                    (f (- x dx))
                    (f x))
                 3)))
(define (repeated f times)
  (if (= times 0)
      f
      (smooth (repeated f (- times 1)))))

;直接用不加修改的repeated总感觉有点问题，不过后来看了遍43，发现自己理解有问题，原来
;写的可能有问题，将repeated再抽象一下，是compose和smooth作为参数传递的话可能会好点。

;还需要再研究下