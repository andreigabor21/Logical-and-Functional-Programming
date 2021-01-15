;;Write a function to determine the depth of a list.

(defun depth(L)
    (cond
        ((atom L) 0)
        (T (1+ (apply #'max (mapcar #'depth L))) )
    )
)

(trace depth)
(print (depth '(1 2 (3 (5) 4))) )
(print (depth '(1 2 (3 4 (5 (8 9 (10)) 6) 7)) ) )