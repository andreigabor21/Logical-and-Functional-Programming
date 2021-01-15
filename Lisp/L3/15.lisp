
;; Write a function that reverses a list together with all its sublists elements, at any level.

(defun rev(L)
    (cond
        ((atom L) L)
        (T (mapcar #'rev (reverse L)))
    )
)

(print (rev '(1 2 3 (4 (6 7) 5))))