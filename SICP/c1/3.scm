;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define (square x) (* x x))
(define (sum-of-squares x y)
  (+ (square x) (square y)))
(define (max-my a b c)
  (cond ((and (>= a b) (>= a c)) a)
        ((>= b c) b)
        (else c)))
(define (max-my-sum a b c)
  (max-my (sum-of-squares a b) (sum-of-squares b c) (sum-of-squares a c)))