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
(define memo-fib       ;(memo-fib n)求值时遇到求出的值就存进table，但有个很大的问题，必须要先求出，存在一种情况，可能fib4的值没存进table，但fib5已经展开到01阶段了，怎么解释？
  (memoize (lambda (n) ;解释器求值是有先后顺序的，会先试着去求一个，而不是两个同时求，这样的话，求5会先去求4，接着先去求3，依次下去，直到01，将01的值存入table，接着将2的值存入table
	     (cond ((= n 0) 0);要去求3时，发现另一半1在table中，求4时，发现32都在table中，这样所有另一半的求值就只是查表。因此，复杂度是O(n)。
		   ((= n 1) 1)
		   (else (+ (memo-fib (- n 1))
			    (memo-fib (- n 2))))))))
;先看生成的两个过程对象（对于一个给定的环境求值lambda表达式，将创建一个过程对象）
;memoize
;环境指针：指向外围环境
;代码：从(let ((table开始
;memo-fib
;环境指针：指向外围环境
;代码：这个是lambda相关表达式求值的第二种：将过程对象应用于实际参数。具体结果见memoize的将过程应用于实际参数。
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;将过程应用于实际参数
;memoize
;将let转换位lambda形式。
;构造出一个新框架E1，E1的外界环境是全局环境。在E1中将形式参数f约束到实际参数（那一大串）。然后在E1中求值过程的体，即从(let((table开始的部分，
;将let((table。部分转换为lambda形式，可知该lambda表达式求值也是第二种情况：将过程对象应用于实际参数。
;创建一个新的框架E2，E2的外界环境是E1.在E2中将形式参数table约束到（make-table)的返回值。在E2中求值过程的体。即（lambda（x）部分
;现在是第一种情况，得到一个过程对象，该过程对象的外界环境指针是指向E2的，代码是(let ((previously-部分。完毕。这就是memo-fib生成的过程
;memo-fib
;假设此处是3
;之前已求得memo-fib是什么过程对象（即将memoize的过程对象应用到那一大串实际参数所得到的）。现在将这一过程对象应用到实际参数3.
;创建出一个新框架E3，该框架的外围环境是E2.在E3中将形式参数x约束到实际参数3.然后在E3中求值该过程的体。即(let ((previously-部分
;(let ((previously-部分转换为lambda形式，是第二种情况。
;这时会创建一个新的框架E4，E4的外界环境是E3.在E4中将形式参数previously..约束到实际参数(look-up x table)。在E4中求值过程的体，即(or部分
;在E4中求值or表达式。previously..为假。接着往下求。求值(let ((result部分。
;将(let ((result转化为lambda表达式形式。可知是第二种情况
;创建一个新的框架E5，E5的外界环境是E4，在E5中将形式参数result约束到实际参数(f x)即(f 3)的值。假设求到的值是s，
;在E5中将形式参数result的值约束到实际参数s，然后在E5中求值过程的体，即(insert!..部分。将3和s插入到E2的table中，返回result作为返回值。

;将过程对象f应用到实际参数3.创建一个新的框架E6，E6的外围环境是全局环境，在E6中将形式参数x约束到实际参数3，并在E6中求值该过程的体。即(cond ((部分
;在E6中求值过程的体。往下走，求值(memo-fib 2)和(memo-fib 1)。在E6中找不到memo-fib，跑到全局环境去找，找到了，然后将memo过程对象应用到实际参数2和1，这里以1为例继续推倒
;创建一个新的环境E7，E7的外围环境是E2，与之前类似，又走到求值(f 1),(f 1)是1，还是类似，将1 1插入到E2的table中，并返回1作为返回值。
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;此处有个很大的疑惑，这里的实际参数是个函数的返回值，那么(f x)产生的框架的外围环境是哪个？
;参照课本165页。函数f即(lambda (n)部分。对该lambda表达式求值时所得到的环境指针指向的环境即外围环境。
;那这个外围环境具体是哪个呢？
;根据复合组合式的求值规则p163,先求值子表达式，然后将运算符子表达式的值应用于运算对象子表达式的值，相当于将过程对象应用到实际参数。可以判断，（lambda (n)的外围环境是全局环境
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
