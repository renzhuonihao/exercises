(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
	 (count-pairs (cdr x))
	 1)))


(define pair-3 (list 1 2 3));3
(define p1 (cons 'm '()))
(define p2-1 (cons p1 'a))
(define p2-2 (cons p1 p1))
(define p3-1 (cons p2-1 p1));4
(define p3-2 (cons p2-2 p2-2));7
(set-cdr! (cdr (cdr pair-3)) pair-3);此时对pair-3 count-pairs不返回结果。