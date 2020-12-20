(defun insPrimaPoz(e l)
    (cond
        ((null l) nil)
        (t (cons (cons e (car l)) (insPrimaPoz e (cdr l)) ))
    )
)

(print (insPrimaPoz '3 '(() (2) (1) (1 2))))

(defun subm(l)
    (cond
        ((null l) (list nil) )
        (T (append (subm (cdr l)) (insPrimaPoz (car l) (subm (cdr l) ) )))
    )
)

(print (subm '(1)))
;(trace (insPrimaPoz))
(trace (subm))
(subm '(1))