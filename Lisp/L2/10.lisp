;;Return the level of a node X in a tree of type (2). The level of the root element is 0.

(defun getLevel(el tree level)
    (cond
        ((null tree) nil)
        ((equal el (car tree)) (return-from getLevel level) )
        (T (or (getLevel el (cadr tree) (1+ level)) (getLevel el (caddr tree) (1+ level)) ) )
    )
)

(print (getLevel 'D '(A (B) (C (D) (E))) 0) )