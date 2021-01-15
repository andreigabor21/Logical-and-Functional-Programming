(defun replace-even (l)
    (cond
        ((and (numberp l) (evenp l)) (1+ l))
        ((atom l) l)
        (T (mapcar #'replace-even l))
    )
)

;; (print (replace-even '(1 s 4 (2 f (7)))))

(defun replace_even (l)
    (cond
        ((null l) nil)
        ((and (numberp (car l)) (evenp (car l))) (cons (1+ (car l)) (replace_even (cdr l))))
        ((listp (car l)) (cons (replace_even (car l)) (replace_even (cdr l)))) 
        (T (cons (car l) (replace_even (cdr l))))
    )
)

;; (print (replace_even '(1 s 4 (2 f (7)))))


;; determine the number of sublists at any level of a given list, where
;; the maximal numberic atom on all odd levels is even

(defun maxim (l m)
    (cond
        ((null l) m)
        ((> (car l) m) (maxim (cdr l) (car l)))
        (T (maxim (cdr l) m))
    )
)

(defun numbers-odd-levels (l lvl)
    (cond  ;;we need odd levels but this function will enter on T first and level will be incremented, so we check for evenp
        ((and (evenp lvl) (numberp l)) (list l))
        ((atom l) nil)
        ;; (T (apply #'append (mapcar #'(lambda (lst) (numbers-odd-levels lst (1+ lvl))) l)))
        (T (mapcan #'(lambda (lst) (numbers-odd-levels lst (1+ lvl))) l))

    )
)


(defun check (l lvl)
    (cond
        ((evenp (maxim (numbers-odd-levels l lvl) -999)) T)
        (T nil)
    )
)


(defun count-sub (l lvl)
    (cond
        ((atom l) 0)
        ((and (listp l) (check l lvl)) (1+ (apply #'+ (mapcar #'(lambda (lst) (count-sub lst (1+ lvl))) l ))))
        (T (apply #'+ (mapcar #'(lambda (lst) (count-sub lst (1+ lvl))) l )))
    )
)


(defun main (l)
    (count-sub l 0)
)

;; (trace count-sub)
(print (main '(A (B 2) (1 C 4) (1 (6 F)) (((G) 4) 6)) ) )
