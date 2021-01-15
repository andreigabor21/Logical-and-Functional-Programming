;;2. Write a function that returns the sum of numeric atoms in a list, at any level.


(defun sum_nums(l)
    (cond
        ((numberp l) l)
        ((atom l) 0)
        (T (apply #'+ (mapcar #'sum_nums l)) )
    )
)

(trace sum_nums)
(print (sum_nums '(1 (2 3 (4 5 ('A 7) (8 9 (10))))) ) )