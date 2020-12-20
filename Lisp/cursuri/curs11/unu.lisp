(defun f(L e)
    (list e L)
)

(setq L '(1 2 3))
(setq e 4)

;(mapcar #'f L e)
;(trace f)
;(print (mapcar #'(lambda (L) (f L e) ) L ) )

;;;;;;;;;;;;;;;;;;;;;;;

(defun f(L)
    (list L)
)

(print (mapcar #'f '(1 2 3)) )
(print (mapcan #'f '(1 2 3)) )
(print (apply #'append (mapcar #'f L)))