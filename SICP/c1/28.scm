;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |28|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define (next-odd n)
  (if (even? n)
      (+ n 1)
      (+ n 2)))
(define (square x) (* x x))
(define (nsro a n)
  (remainder (square a) n))

;;没做出来，真是晕