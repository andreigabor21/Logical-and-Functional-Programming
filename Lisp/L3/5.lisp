(defun sum_even_odd(L)
    (cond
        ((null L) 0)
        ((and (numberp L) (= (mod L 2) 0)) L)
        ((and (numberp L) (= (mod L 2) 1)) (- L))
        ((atom L) 0)
        (T (apply #'+ (mapcar #'sum_even_odd L)))
    )
)

(print (sum_even_odd '(1 2 (3 4 8 (10))) ) )