;;Write a function to determine the number of nodes on the level k 
;;from a n-tree represented as follows:
;;(root list_nodes_subtree1 ... list_nodes_subtreen)
;;Eg: tree is (a (b (c)) (d) (e (f))) and k=1 => 3 nodes

(defun count_nodes(tree current k)
    (cond
        ((and (atom tree) (equal current k)) 1)
        ((atom tree) 0)
        (T (apply #'+ (mapcar #'(lambda (L) (count_nodes L (1+ current) k)) tree)) )
    )
)

(trace count_nodes)
(print (count_nodes '(a (b (c)) (d) (e (f))) -1 2) )