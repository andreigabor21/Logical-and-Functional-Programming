(defun count_atoms(L)
    (cond
        ((atom l) 1)
        (T (apply #'+ (mapcar #'count_atoms L)) )       
        ;(T (mapcar #'count_atoms L)) 

    )
)
(trace count_atoms)
(print (count_atoms '(1 (2 (a) c d) (3)) ) )