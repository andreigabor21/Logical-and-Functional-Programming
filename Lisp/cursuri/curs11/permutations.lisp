;;;;WITHOUT MAPS

(defun ins(e n l)
    (cond
        ((equal n 1) (cons e l))
        (T (cons (car l) (ins e (1- n) (cdr l))))
    )
)

;; (print (ins '1 1 '(2 3)))
;; (print (ins '1 2 '(2 3)))
;; (print (ins '1 3 '(2 3)))

(defun insert(e n l)
    (cond
        ((equal n 0) nil)
        (T (cons (ins e n l) (insert e (1- n) l) ))
    )
)

;; (print (insert '1 3 '(2 3)))

(defun inserare(e l)
    (insert e (1+ (length l)) l)
)

(print (inserare '1 '(2 3)))

(defun without(e L)
    (cond
        ((equal e (car L)) (cdr L))
        (T (cons (car L) (without e (cdr L)) ))
    )
)
;(print (without '2 '(1 2 3)))

(defun perm(L)
    (cond
        ((null L) nil)
        (T (append (perm (cdr L)) (inserare (car L) L)))  
    )
)

;(trace perm)
(print (perm '(1 2 3)) )

;;;;WITH MAPS

(defun permutari(L)
    (cond
        ((null (cdr L)) (list L))
        (T (mapcan #'(lambda (e)
                        (mapcar #'(lambda (p)
                                    (cons e p)
                                  )
                            (permutari (remove e L))
                        )
                    )
                L
            )
        )
    )
)

;(trace permutari)
(print (permutari '(1 2 3)))