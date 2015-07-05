;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
;#reader(lib "htdp-advanced-reader.ss" "lang")((modname |11|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;;递归计算过程版本
(define (f n)
  (if (< n 3)
      n
      (+ (* 2 (f (- n 2)))
         (f (- n 1))
         (* 3 (f (- n 3))))))
;;迭代计算过程版本1
(define (fun n)
  (fun-iter 0 1 2 n))
(define (fun-iter a b c count)
  (if (= 0 count)
      a
      (fun-iter b c (+ (* 2 b)
                       (* 3 a)
                       c)
                (- count 1))))
;;迭代计算过程版本2
(define (f2 n)
  (f2-iter 0 1 2 0 n))
(define (f2-iter a b c count max-count)
  (if (= count max-count)
      a
      (f2-iter b c (+ (* 2 b)
                      (* 3 a)
                      c)
               (+ count 1)
               max-count)))

(+ 1 2)