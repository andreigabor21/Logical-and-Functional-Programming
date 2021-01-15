(defun replace-level (l k e)
    (cond
        ((and (atom l) (equal k -1)) e)
        ((atom l) l)
        (T (mapcar #'(lambda (lst) (replace-level lst (1- k) e))l))
    )
)

(print (replace-level '(a (b (g)) (c (d (e)) (f))) 2 'h))
(print (replace-level '(a (b (g)) (c (d (e)) (f))) 4 'h))


(defun first-num (l)
    (cond
        ((null l) nil)
        ((numberp (car l)) (return-from first-num (car l)))
        (T (first-num (cdr l)))
    )
)
(print (first-num '(A 2 C)))