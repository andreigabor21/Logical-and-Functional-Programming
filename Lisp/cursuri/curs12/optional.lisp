(defun f (l1 &rest l2)
    (cond
    
        ((null (car l2)) nil)
        (T (cons (mapcar #'* l1 (car l2)) (f l1 (cadr l2))))
    )
)

(print (f '(1 2) '(3 4) '(5 6)))

(defun inc (numar)
    (+ numar 1)
)

(defun inc (numar increment)
    (+ numar increment)
)

(defun inc (numar &optional increment)
    (cond
        ((null increment) (+ numar 1))
        (T (+ numar increment))
    )
)

(defun lungime(l)(prog ((lung 0) (lista l))et
10(cond((null lista) (return lung))(t (setq lung (+ lung 1))(setq lista (cdr lista))(go et)) )))

(print (lungime '(1 2 3)))