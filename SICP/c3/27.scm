;这个题的环境模型弄明白，环境模型理解基本到位了
(define (make-table)
  (list '*table*))
(define (assoc key records)
  (cond ((null? records) false)
	((equal? key (caar records)) (car records))
	(else (assoc key (cdr records)))))
(define (look-up key table)
  (let ((record (assoc key (cdr table))))
    (if record
	(cdr record)
	    false)))
(define (insert! key value table)
  (let ((record (assoc key (cdr table))))
    (if record
	(set-cdr! record value)
	(set-cdr! table
		  (cons (cons key value) (cdr table))))
    'OK))
(define (memoize f)
  (let ((table (make-table)))
    (lambda (x)
      (let ((previously-computed-result (look-up x table)))
	(or previously-computed-result
	    (let ((result (f x)))
	      (insert! x result table)
	      result))))))
(define memo-fib       
  (memoize (lambda (n) 
	     (cond ((= n 0) 0)
		   ((= n 1) 1)
		   (else (+ (memo-fib (- n 1))
			    (memo-fib (- n 2))))))))

(define (mem-fib n)
  (let ((table (make-table)))
    (define (fib n)
      (let ((pre (look-up n table)))
	(or pre
	    (cond ((= n 0) 0)
		  ((= n 1) 1)
		  (else 
		   (let ((p1 (fib (- n 1))))
		     (insert! (- n 1) p1 table)
		     (+ p1 (fib (- n 2)))))))))
    (fib n)))

;这个程序真是考验对环境模型的理解，确实收获很大。
;自己写了一个版本，但是性能还有一点差距