(defun delete_neg(l)
    (cond
        ((and (numberp l) (minusp l)) nil)
        ((atom l) (list l))
        (T (list (apply #'append (mapcar #'delete_neg l)) ) )
    )
)

(defun main(l)
    (car (delete_neg l))
)

(trace delete_neg)
(print (main '(1 -3 (a b -8 9 (-4 2))) ))