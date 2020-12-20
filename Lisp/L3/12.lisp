;;12. Write a function that substitutes an element through another one at all levels of a given list

(defun _replace (l elem repl)
    (cond
        ((null l) nil)
        ((equal elem l) repl)
        ((atom l) l)
        (T (apply 'list (mapcar (lambda (l) (_replace l elem repl)) l ) ) )
    )
)

(print (_replace '(1 2 3 (1 2 (5 1 2)) 1 2) 1 9 ) )
(trace _replace)
(_replace '(2 1 3 (1 2 (5 1 2)) 1 2) 1 9 )