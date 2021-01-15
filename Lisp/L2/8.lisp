;;Return the list of nodes of a tree of type (2) accessed inorder

(defun inorder(tree)
    (cond
        ((null tree) nil)
        (T (append (inorder (cadr tree)) (list (car tree)) (inorder (caddr tree)) ))
    )
)

(print (inorder '(A (B) (C (D) (E))) ) ) 