;; Write a function that produces the linear list of all atoms of a given list, from all levels, and written in
;; the same order

(defun linear(L)
    (cond
        ((atom L) (list L))
        (T (mapcan #'linear L))
    )
)

(print (linear '(((A B) C) (D E)) ))