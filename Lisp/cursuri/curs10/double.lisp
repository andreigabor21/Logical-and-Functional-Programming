(defun double(l)
    (cond
        ((numberp l) (* 2 l))
        ((atom l) l)
        (T (mapcar #'double l))
    )
)

(trace double)
(print (double '(1 (b (4) c) (d (3 (5 f)))) ))
