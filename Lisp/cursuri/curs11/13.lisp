(defun fct(L)
    (cond
        ((null (car L)) nil)
        (T (cons 
                (mapcar #'car L)
                (fct (mapcar #'cdr L))
        ))
    )
)

(print (fct '((1 2 3) (4 5 6) (7 8 9))) )
(print (mapcar #'car '((1 2 3) (4 5 6) (7 8 9))))
(print (mapcar #'cdr '((1 2 3) (4 5 6) (7 8 9))))
