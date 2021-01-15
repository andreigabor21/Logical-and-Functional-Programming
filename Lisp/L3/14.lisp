;;Write a function that returns the number of atoms in a list, at any level.

(defun count(l)
    (cond
        ((atom l) 1)
        (T (apply #'+ (mapcar #'count l)))
    )
)

(print (count '(1 2 3 (4 5) (6 7 (8 9 (10) (11 (12))) 13)) ) )