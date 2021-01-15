(defun f (l)
    (cond
        ((atom l) -1)
        ((> (f (car l)) 0) (+ (car l) (f (car l)) (f (cdr l))))
        (T (f (cdr l)))
    )
)

;; (print (f '(1 2 3)))

(defun f (l)
    (cond
        ((atom l) -1)
        ((lambda (x)
            (cond
                ((> x 0)
                    (+ (car l) x (f (cdr l))))
            )
         ) (f (car l))
        )
        (T (f (cdr l)))
    )
)

;; (print (f '(1 2 3)))

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

;; (print (replace-zero '(a (1 (2 b)) (c (d))) '2))
;; (print (replace-zero '(a (1 (2 b)) (c (d))) '1))

;; number of sublists here the minimal numberic atom on odd levels is even

(defun minim (l min)
    (cond
        ((null l) min)
        ((< (car l) min) (minim (cdr l) (car l)))
        (T (minim (cdr l) min))
    )
)

(defun linear (l lvl)
    (cond
        ((and (numberp l) (oddp lvl)) (list l))
        ((atom l) nil)
        (T (mapcan #'(lambda (lst) (linear lst (1+ lvl))) l))
    )
)

;; (print (linear '(A (B 2)) '1))

(defun check (l)
    (cond
        ((evenp (minim (linear l 0) 999)) T)
        (T nil)
    )
)
;; (print (check '(A (B 2)) ))

(defun count-sub (l)
    (cond
        ((atom l) 0)
        ((check l) (1+ (apply #'+ (mapcar #'count-sub l))))
        (T (apply #'+ (mapcar #'count-sub l)))
    )
)

(trace count-sub)
(print (count-sub '(A (B 2) (2 C 4) (1 (3 F)) (((G) 4) 2) )))









