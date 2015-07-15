(define (count-pairs-correct list)
  (define (not-in? l table)
    (cond
     ((eq? table '()) #t)
     ((eq? (car table) l) #f)
     (else
      (not-in? l (cdr table)))))
  (define (add l)
    (set! table (cons l table)))
  (define (go-over l)
    (if (pair? l)
	(begin 
	  (if (not-in? l table)
	      (add l))
	  (go-over (car l))
	  (go-over (cdr l)))))
  (define table '())
  (go-over list)
  (length table))