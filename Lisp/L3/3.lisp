(defun hasNode(el tree)
    (cond
        ((null tree) nil)
        ((equal el tree) (return-from hasNode T))
        ((atom tree) nil)
        (T (reduce #'(lambda (x y) (or x y)) 
                (mapcar #'(lambda (tree) (hasNode el tree)) tree) 
            )
        )
    )
)

(trace hasNode)
(print (hasNode 'b '(a (e (c)) (b) (E (f)) ) ) )