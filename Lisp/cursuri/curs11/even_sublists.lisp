(defun even_length(L)
    (cond
        ((equal (mod (length L) 2) 0 ) T )
        (T nil)
    )
)

(defun counts(L)
    (cond 
        ((atom l) 0)
        ((even_length L) (1+ (apply #'+ (mapcar #'counts L))) )
        (T (apply #'+ (mapcar #'counts L)) )
    )
)
(trace counts)
(print (counts '(1 (2 (3 (4 5) 6)) (7 (8 9)))) )