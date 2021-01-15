(defun m(L)
    (cond
        ((numberp L) L)
        ((atom L) most-negative-fixnum)
        (T (apply #'max (mapcar #'m L)))
    )
)

(print (m '(1 2 (3 5 9) 4)))

(defun even(x)

)

(defun lista (L)
    (mapcan #'(lambda (v)
                (cond
                    ((evenp v) (list v))
                    (T nil)
                )
               )
        L
    )
)

(trace lista)
(print (lista '((5 a (2 b (8))) (7 a (9)) (c d (10))) ) )