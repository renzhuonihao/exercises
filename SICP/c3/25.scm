(define (make-table same-key?)
  (let ((local-table (list '*table*)))
    (define (assoc keys-table records)
      (cond ((null? records) false)
	    ((same-key? keys-table (caar records)) (car records))
	    (else (assoc keys-table (cdr records)))))
    (define (look-up keys-table)
      (let ((record (assoc keys-table (cdr local-table))))
	(if record
	    (cdr record)
	    false)))
    (define (insert! keys-table value)
      (let ((record (assoc keys-table (cdr local-table))))
	(if record
	    (set-cdr! record value)
	    (set-cdr! local-table
		      (cons (cons keys-table value) (cdr local-table))))
      'OK))
    (define (dispatch m)
      (cond ((eq? m 'look-up-proc) look-up)
	    ((eq? m 'insert-proc!) insert!)
	    (else (error "Unknown operation -- TABLE" m))))
    dispatch))
(define t1 (make-table equal?))

;感觉不用改，一维表格就ok
