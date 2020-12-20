(defun lin(L)
    (cond
        ((atom l) (list l))
        (T (mapcan #'lin (reverse L)) )
    )
)

(trace lin)
(print (lin '(A (B C (D (E))) (F G))) )