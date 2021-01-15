(defun product(L)
    (cond
        ((null L) 1)
        ((numberp L) L)
        ((atom L) 1)
        (T (apply #'* (mapcar #'product L)) )
    )
)

(print (product '(1 (2 3 5 (6 (7 (8 9)))) 4)))