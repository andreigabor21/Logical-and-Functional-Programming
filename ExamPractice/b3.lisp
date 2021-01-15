(defun f (l)
    (cond
        ((atom l) -1)
        ((> (f (car l)) 0) (+ (car l) (f (car l)) (f (cdr l))))
        (T (f (cdr l)))
    )
)

;; (print (f '(1 2 3)))

(defun f2 (l)
    (cond
        ((atom l) -1)
        ((lambda (x) 
            (when (> x 0)
                (+ (car l) x (f (cdr l))))
        ) (f (car l)))
        (T (f (cdr l)))
    )
)

;; (print (f2 '(1 2 3)))

(defun f3 (l)
    ((lambda (x)
        (cond
            ((atom l) -1)
            ((> x 0) (+ (car l) x (f (cdr l))))
            (T (f (cdr l)))
        )
    ) (f (car l)))
)

;; (print (f3 '(1 2 3)))

(defun g (f l)
    (funcall f l)
)

(print (g #'(lambda (l) (g #'cdr l)) '(1 2 3)))


(defun replace-even (l)
    (cond
        ((and (numberp l) (evenp l)) (1+ l))
        ((atom l) l)
        (T (mapcar #'replace-even l))
    )
)

(print (replace-even '(1 s 4 (2 f (7)))))