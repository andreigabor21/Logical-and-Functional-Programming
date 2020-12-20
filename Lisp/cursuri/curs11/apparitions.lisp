(defun nrap(e l)
    (cond
        ((equal e l) 1)
        ((atom l) 0)
        (T (apply #'+ (mapcar #'(lambda (l) (nrap e l)) l)))
    )
)

(print (nrap 'a '(1 (a (3 4 (a)) (7 (a (9 a))))) ) )