(defun f (l)
    (cond
        ((null l) 0)
        ((> (f (car l)) 2) (+ (car l) (f (cdr l))))
        (T (f (car l)))
    )
)

;; (print (f '(1 2 3)))

(defun f2 (l)
    (cond
        ((null l) 0)
        ((lambda (x) (> x 2) (+ (car l) (f (cdr l)))
                    (T (f (car l)))
         ) (f (car l)) 
        )
    )
)

;; (print (f2 '(1 2 3)))

;;I.3

(defun f(x &rest y)
    (cond
        ((null y) x)
        (T (append x (mapcar #'car y)))
    )
)

(print (append (f '(1 2)) (f '(3 4) '(5 6) '(7 8))) )
(print (f '(1 2)))

(print (f '(3 4) '(5 6) '(7 8)))


(defun replace-zero(list level)
    (cond
        ((and (equal level 0) (atom list)) 0)
        ((atom list) list)
        (T (mapcar #'(lambda (lst) 
                         (replace-zero lst (1- level)) 
         
                     ) 
                list
           )
        )
    )
)

(print (replace-zero '(a (1 (2 b)) (c (d))) 2))