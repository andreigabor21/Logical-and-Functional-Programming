;;Write a function that removes all occurrences of an 
;;atom from any level of a list

(defun remove-all(e l)
    (cond
        ((equal e l) nil)
        ((atom l) (list l))
        (T (list (mapcan #'(lambda (L) (remove-all e L)) l) ))
    )
)

(print (car (remove-all '2 '(1 2 3 (5 2 (7 5 2))))) )
