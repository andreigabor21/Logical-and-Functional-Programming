(defun lin (l)
    (cond
        ((null l) T)
        ((and (atom (car l)) (lin (cdr l))) )
    )
)

;; (print (lin '(1 2 3)))

(defun verif (l)
    (cond
        ((null l) T)
        (T (and (lin (car l)) (verif (cdr l))))
    )
)

(print (verif '((1 2) (a (b)))) )
(print (verif '((1 2) (a b))) )


(defun gen (f l)
    (cond
        ((null l) T)
        (T (and (funcall f (car l)) (gen f (cdr l))))
    )
)

(defun verif2 (l)
        ;; ((and (gen #'(lambda (v) (atom v)) (car l)) (verif2 (cdr l))))
    (gen #'(lambda (L)
                (gen #'atom L)) 
        l
    )
)

(print (verif2 '((1 2) (a (b)))) )
(print (verif2 '((1 2) (a b))) )
