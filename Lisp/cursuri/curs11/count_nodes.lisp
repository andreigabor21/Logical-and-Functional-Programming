(defun count_nodes(l)
    (cond
        ((null l) 0)
        ((atom l) 1)
        (T (apply #'+ (mapcar #'count_nodes l)) )

        ;((null (cdr l)) 1)
        ;(T (+ 1 (apply #'+ (mapcar #'count_nodes (cdr l)))) )
    )
)

(trace count_nodes)
(print (count_nodes '(a (b (c) (d (e)) (f () (g)))) ) )