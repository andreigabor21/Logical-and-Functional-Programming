;;a) Write a function to return the dot product of two vectors

(defun dotp(v1 v2)
    (cond
        ((null v1) 0)
        (T (+ (* (car v1) (car v2)) (dotp (cdr v1) (cdr v2)) ) )
    )
)
(format t "Dot product:~%")
(write (dotp '(1 2) '(4 5)))
( terpri)

;;b) Write a function to return the maximum value of all the 
;;numerical atoms of a list, at any level.

(defun max_total(l)
    (cond
        ((null l) -999999)
        ((numberp (car l)) (max (car l) (max_total (cdr l))) )
        ( (listp (car l)) (max (max_total (car l)) (max_total (cdr l))) )
        (T (max_total (cdr l)))    
    )
)

(format t "Maximum value:~%")
(write (max_total '(1 (2 3) (-7 A 2 (20 B 87)) 10)))
( terpri)
(write (max_total '(-1 F (-8 0))))
( terpri)

;;c) Write a function to compute the result of an arithmetic expression memorised in preorder on a stack

(defun helper(op a b)
    (cond
        ((string= op "+") (+ a b))
        ((string= op "-") (- a b))
        ((string= op "*") (* a b))
        ((string= op "/") (floor a b))
    )
)

(defun expression(l)
    (cond 
        ((null l) nil)
        ((and (and (numberp (cadr l)) (numberp (caddr l))) (atom (car l))) (cons (helper (car l) (cadr l) (caddr l)) (expression (cdddr l))))
        (T (cons (car l) (expression (cdr l))))
    )
)

(defun solve(l)
    (cond 
        ((null (cdr l)) (car l))
        (T (solve (expression l)))
    )
)

(format t "Preorder expressions:~%")
(write (solve '(+ * 2 4 3)))
( terpri)
(write (solve '(+ * 2 4 - 5 * 2 2)))
( terpri)

;;Write a function to return T if a list has an even number of elements on the first level, and NIL on the contrary case, without counting the elements of the list

(defun even(l)
    (cond
        ((null l) T)
        ((null (cdr l)) nil)
        (T (even (cddr l)))
    )
)

(format t "Even number:~%")
(write (even '(1 2 3 4 5)))

( terpri)
(write (mod 12 5))