;; Define a function that returns the depth of a tree represented as (root list_of_nodes_subtree1 ...
;; list_of_nodes_subtreen)

(defun depth(tree)
    (cond
         ((null (cdr tree)) 0)
         (T
            (1+ (reduce #'max (mapcar #'depth (cdr tree))))
         )
    )
)

(print (depth '(a (b (c)) (d) (e (f (g)))) ) ) 

      