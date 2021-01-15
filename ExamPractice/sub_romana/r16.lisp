(defun f (l)
    (cond
        ((null l) nil)
        ((listp (car l)) (append (f (car l)) (f (cdr l)) (car (f (car l)))))
        (T (list (car l)))
    )
)

(defun f (l)
    (cond
        ((null l) nil)
        ((listp (car l))
            ((lambda (x) (append x (f (cdr l)) (car x))) (f (car l)) ) )
        (T (list (car l)))
    )
)

(print (f '(1 2 3)))

(defun f(l)
    (cond
        ((atom l) -1)
        ((> (f (car l)) 0) (+ (car l) (f(car l)) (f(car l))))
        (t (f (cdr l)))
    )
)

(print (f '(1 2 3)))

(defun f (l)
    (cond
        ((atom l) -1)
        ((lambda (x)
            (when (> x 0)
                (+ (car l) x x))
        ) (f (car l)) )
        (T (f (cdr l))) 
    )
)

(print (f '(1 2 3)))
