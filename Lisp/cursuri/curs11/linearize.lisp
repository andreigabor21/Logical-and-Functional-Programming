(defun linearize(L)
    (cond
        ((atom L) (list L))
        (T (mapcan #'linearize L))
    )
)

(print (linearize '(1 2 3 (4 (5 6 (7 8) (9))) ((10)) ) ) )

(defun linearize2(L)
    (cond
        ((atom L) (list L))
        (T (apply #'append (mapcar #'linearize L)) )
    )
)

(print (linearize2 '(1 2 3 (4 (5 6 (7 8) (9))) ((10)) ) ) )
