;;a) Write a function that merges two sorted linear lists and keeps double values

(defun merge_list(l k)
    (cond
        ((null l) k)
        ((null k) l)
        ((< (car l) (car k)) (cons (car l) (merge_list (cdr l) k)) )
        (T (cons (car k) (merge_list l (cdr k))) )
    )
)
(write (merge_list '(1 2 2 4) '(3 5 5 6) ))
( terpri)

;;b) Write a function to replace an element E by all elements of a list L1 at all levels of a given list L.

(defun _replace (l e r)
		(cond
			((null l) nil)
			((listp	(car l)) (cons (_replace (car l) e r) (_replace (cdr l) e r)))
			((= (car l) e) (append r (_replace (cdr l) e r)))
			(T (cons (car l) (_replace (cdr l) e r)))
		)
)

(write (_replace '(1 2 3 4 5) 3 '(9 10) ))

