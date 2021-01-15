;;Write a function that returns the maximum of numeric atoms in a list, at any level.

(defun global_max(l)
    (cond
        ((numberp l) l)
        ((atom l) most-negative-fixnum)
        (T (apply #'max (mapcar #'global_max l)) )
    )
)

;; (trace global_max)
(print (global_max '(1 2 (3 (A 8) 2) (5))) )