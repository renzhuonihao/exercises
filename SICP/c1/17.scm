;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |17|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define (fast-mul a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-mul a (halve b))))
        (else (+ a (fast-mul a (- b 1))))))
(define (double n) (* 2 n))
(define (halve n) (/ n 2))
        