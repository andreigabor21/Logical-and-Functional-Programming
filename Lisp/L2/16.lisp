;; Determine if a tree of type (2) is balanced (the difference between the depth of two subtrees is
;; equal to 1).

(defun balanced(tree level)
    (cond
        ((null tree) level)
        (T 
            (setq left (balanced (cadr tree) (1+ level)))
            (setq right (balanced (caddr tree) (1+ level)))
            (cond
                ((or (null left) (null right)) NIL)
                ((< (abs (- left right)) 2)
                    (cond
                        ((< left right) right)
                        (T left)
                    )
                )
                (T nil)
            )
        )
    )
)

(defun wrapper(res)
    (cond
        ((null res) nil)
        (T t)
    )
)

(print (wrapper (balanced '(A (B) (C (D) (E))) 0) ) )
(print (wrapper (balanced '(A (B) (C (D) (E (G (F))))) 0) ) )


;;second approach

(defun depth(tree level)
    (cond
        ((null tree) level)
        (T (max (depth (cadr tree) (1+ level))
                (depth (caddr tree) (1+ level))
            )
        )
    )
)

(defun isBalanced(tree)
    (cond
        ((null tree) T)
        ((> (abs (- (depth (cadr tree) 0) (depth (caddr tree) 0))) 1) nil)
        (T (and (isBalanced (cadr tree)) (isBalanced (caddr tree)) ))
    )
)

(print (isBalanced '(A (B) (C (D) (E))) ) )
(print (isBalanced '(A (B) (C (D) (E (G (F))))) ) )

