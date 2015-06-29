;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |18|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define (double n) (* 2 n))
(define (halve n) (/ n 2))
(define (fast-mul a b)
  (mul-iter a b 0))
(define (mul-iter a b s)
  (cond ((= b 0) s)
        ((even? b) (mul-iter (double a)
                             (halve b)
                             s))
        (else (mul-iter a (- b 1) (+ a s)))))