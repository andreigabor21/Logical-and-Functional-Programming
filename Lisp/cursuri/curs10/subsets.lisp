(defun insPrimaPoz(e l)
    (cond
        ((null l) nil)
        (T (cons (cons e (car l)) (insPrimaPoz e (cdr l)) ) )
    )
)

(defun subsets(l)
    (cond
        ((null l) (list nil))
        (T (append (subsets (cdr l)) (insPrimaPoz (car l) (subsets (cdr l)) )  ))
    )
)

(setq l '((1 2) (1 2 3) (5) ()) )
(print (insPrimaPoz 9 l ) )

(setq s '(1 2)) ;(() (1) (2) (1 2)) = (2) -> ((2) ()) -> +1 -> ((2) () (1 2) (1))
(print (subsets s))
;(trace subsets)
;(subsets s)

;;;;lambda style:
(defun _subsets(l)
    (cond
        ((null l) (list nil))
        ;(T (append (subsets (cdr l)) (insPrimaPoz (car l) (subsets (cdr l)) )  ))
        (T ((lambda (s) 
                (append s (insPrimaPoz (car l) s ) )
          ) (_subsets (cdr l)) )
        )
    )
)

(trace _subsets)
(print (_subsets s))