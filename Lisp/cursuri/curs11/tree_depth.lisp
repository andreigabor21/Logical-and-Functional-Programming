
;(print (depth '(a (b (c) (d (e)) (f () (g)))) ) )
;(print (cdr '(a (b (c) (d (e)) (f (g)))) ))

;;without map

(defun _depth(l)
    (cond
        ((null (cdr l)) 0)  ; -> nu are left child si right child (frunza)
        (T (+ 1 (max (_depth (cadr l)) (_depth (caddr l)) )) )
    )
)

;;with map

(defun depth(l)
    (cond
        ((null (cdr l)) 0)
        (T (+ 1 (apply #'max (mapcar #'depth (cdr l)) ) ))
    )
)

(trace depth)
(print (depth '(a (b (d) (e (f))) (c)) ))