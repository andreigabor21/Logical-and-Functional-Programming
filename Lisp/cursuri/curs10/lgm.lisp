(defun lgm(l)
    (cond
        ((atom l) 0)
        (T (max (length l) (apply #'max (mapcar #'lgm l)) ) )
    )
)

(trace lgm)
(print (LGM '(1 (2 (3 4) (5 (6)) (7)))) )