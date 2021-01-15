;;Define a function that replaces one node with another one
;; in a n-tree represented as: root
;;list_of_nodes_subtree1... list_of_nodes_subtreen)
;;Eg: tree is (a (b (c)) (d) (e (f))) and node 'b' will be
;; replace with node 'g' => tree (a (g (c)) (d) (e (f)))

(defun replace_node(tree old new)
    (cond
        ((equal tree old) new)
        ((atom tree) tree)
        (T (mapcar #'(lambda (tr) (replace_node tr old new)) tree) )
    )
)

(print (replace_node '(a (b (c) (a (f (g a)) (d (a))))) 'a 'z))