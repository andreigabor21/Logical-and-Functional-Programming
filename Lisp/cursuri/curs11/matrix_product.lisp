(defun transpose(L)
    (cond
        ((null (car L)) nil)
        (T (cons (mapcar #'car L) (transpose (mapcar #'cdr L) )))
    
    )
)
(print (transpose '((1 2 3) (4 5 6))))

(defun dot_prod(L1 L2)
    (cond
        ((null (car L1)) nil)
        (T (apply #'+ (mapcar #'* L1 L2)) )
    )
)

(print (dot_prod '(1 2) '(2 3)))

(defun mat_prod(L1 L2)
    (cond
        ((null (car L1)) nil)
        (T (cons (mapcar #'(lambda (L) (apply #'+ (mapcar #'* (car L1) L)) ) L2) 
                (mat_prod (cdr L1) L2)
            )
        )
    )
)

(defun mat_prod_main(L1 L2)
    (mat_prod L1 (transpose L2) ) 
)

(print (mat_prod_main '((1 2) (3 4)) '((2 -1) (3 1)) ) )