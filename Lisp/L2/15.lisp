;;Determine the list of nodes accesed in postorder in a tree of type (2).

(defun postorder(tree)
    (cond
        ((null tree) nil)
        (T (append (postorder (cadr tree)) (postorder (caddr tree)) (list (car tree)) ))
    )
)

(trace postorder)
(print (postorder '(A (B) (C (D) (E))) ) )