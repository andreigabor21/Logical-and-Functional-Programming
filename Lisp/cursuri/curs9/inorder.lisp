(defun inordine(l)
    (cond
        ((null l) nil)
        (t (append (inordine (cadr l)) (list (car l)) (inordine (caddr l))) )
    )
)

(print (inordine '(a (b () (f)) (d (e)))))