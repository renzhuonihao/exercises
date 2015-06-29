(define (look-up given-key set-of-records)
  (if (null? set-of-records)
      #f
      (let ((k (key set-of-records)) (r (record set-of-records)))
	 (cond ((same? given-key k) r)
	       ((< given-key k)
		(look-up given-key (left-branch set-of-records)))
	       ((> given-key k)
		(look-up given-key (right-branch set-of-records)))))))
;以下这些由树的具体实现决定,这里给出了其中的一种情况
(define (record set-of-records) (car set-of-records))
(define (key set-of-records) (car (record set-of-records)))
(define (same? a b) (=  a b))
;left-branch与right-branch跟书中的一样

;数据库抽象的选择函数是record与key等。构造函数也是用这几个构造某种数据库。
;改变树的表示，只需要改动下面这些函数即可，若是换成别的数据结构表示数据库，
;则需要重写了可能。
