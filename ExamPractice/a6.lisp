(defun f (l1 l2)
    (append (f (car l1) l2)
        (cond
            ((null l1) (cdr l2))
            (T (list (f (car l1) l2) (car l2)))
        )
    )
)

;;(print (f '(1 2) '(2 3)))

(defun f2 (l1 l2)
    ((lambda (x)
        (append x
            (cond
                ((null l1) (cdr l2))
                (T (list x (car l2))))))
        (f2 (car l1) l2)
    )
)

;; (print (f2 '(1 2) '(2 3)))


(defun good(l1 l2)
    (funcall #'(lambda (temp) 
                    (append temp 
                        (cond 
                            ((null l1) (cdr l2))
                            (t (list temp (car l2)))
                        )
                    )                
               )
            (good (car l1) l2)
    )
)
;; (print (good '(1 2) '(2 3)))

(defun g(l)
    (mapcon #'list l)
)
(print (apply #'append (mapcon #'g '(1 2))) )

;; III
;; remove all numberic atoms divisible with 3 from all levels

(defun remove-div-3 (l)
    (cond
        ((and (numberp l) (equal (mod l 3) 0)) nil)
        ((atom l) (list l))
        (T (list (apply #'append (mapcar #'remove-div-3 l))))
    )
)

(defun main (l)
    (car (remove-div-3 l))
)

;; (trace remove-div-3)
(print (main '(1 (2 A (3 A)) 6)) )
(print (main '(1 (2 (C)))))
;(print (append nil 'A))