;;Write a function that substitutes an element E with all elements 
;;of a list L1 at all levels of a given list L.

(defun substitute(e l1 l)
    (cond
        ((null l) nil)
        ((equal e l) l1)
        ((atom l) l)
        (T (mapcar #'(lambda (L) (substitute e l1 L)) l) )
    )
)

(print (substitute 2 '(1 2) '(3 2 5 (7 2))) )

(defun copy(l)
    (cond
        ((null l) nil)
        (T (cons (car l) (copy (cdr l))))
    )
)

(defun substitute2(e l1 l)
    (cond
        ((equal l e) (copy l1)) ;; copy required to avoid losing l1 due to destructive behaviour of mapcan
        ((atom l) (list l))
        (T (list (mapcan #'(lambda (lst) (substitute2 e l1 lst)) l)))
    )
)

(trace substitute2)
(print (car (substitute2 2 '(9 9) '(2 3 5 (7 2)))) )