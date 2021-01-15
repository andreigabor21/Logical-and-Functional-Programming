(defun f(l)
    (cond
        ((null l) 0)
        ((> (f (car l)) 2) (+ (car l) (f (cdr l))))
        (T (f (car l)))
    )
)

;; (print (f '(1 2 3)))

(defun f (l)
    ((lambda (x)
        (cond
            ((null l) 0)
            ((> x 2) (+ (car l) (f (cdr l))))
            (T x)
        )
    )  (f (car l)) )
)

;; (print (f '(1 2 3)))

;;calea de la radacina catre un nod dat

(defun myOr(L)
	(cond
		( (null L) nil)
		( (car  L) t  )
		(t (myOr (cdr L)) )
	)
)

(defun exist(Tr N)
	(cond
		( (and (atom Tr) (equal Tr N)) t)
		( (atom Tr) nil)
		(t (myOr (mapcar #'(lambda(L)(exist L N)) Tr )))
	)
)
(defun takeElem(L)
	(cond
		((null L) nil)
		((car L) (car L) )
		(t (takeElem (cdr L)))
	)
)
(defun path(L N)
	(cond
		( (atom L) nil)
		((exist L N) (append (list(car L))  (takeElem(mapcar #'(lambda(L)(path L N)) L )) ) )
		(t nil)
	)
)

(print (path '(a (b (g)) (c (d (e)) (f))) 'e ))


