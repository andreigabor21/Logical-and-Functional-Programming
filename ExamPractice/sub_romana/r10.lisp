(defun double (l i n)
    (cond
        ((null l) nil)
        ((equal (mod i n) 0) (cons (car l) (cons (car l) (double (cdr l) (1+ i) n))))
        (T (cons (car l) (double (cdr l) (1+ i) n)))
    )
)

(print (double '(1 2 3 4 5) '1 '2))

;;(list (car l) (car l))