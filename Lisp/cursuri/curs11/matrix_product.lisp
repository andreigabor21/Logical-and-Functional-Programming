(defun coloane(L)
    (cond
        ((null (car L)) nil)
        (T (cons
            (mapcar #'car L)
            (coloane (mapcar #'cdr L))
        ))
    )
)

(print (coloane '((1 2) (3 4))))


;; (defun product(L1 L2)
;;     (prod L1 (coloane L2))
;; )

;; (print (product '((1 2) (3 4)) '((2 -1) (3 1)) ))