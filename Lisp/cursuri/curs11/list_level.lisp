(defun level(l n)
    (cond
        ((and (= 0 n) (atom l)) (list l))
        ((= 0 n) nil)
        ((atom l) nil)
        (T (mapcan #'(lambda (l) (level l (1- n))) l) )
    )
)

(print (level '(a (b) (c (d e f))) 3) )