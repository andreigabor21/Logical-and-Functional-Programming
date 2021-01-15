;;remove all occurences of a given element from all levels of a list

;;with MAP:

(defun remove-all (l e)
    (cond
        ((equal l e) nil)
        ((atom l) (list l))
        (T (list (mapcan #'(lambda (lst) (remove-all lst e)) l)))
    )
)

(defun main (l e)
    (car (remove-all l e))
)

;; (print (main '(1 (2 A (3 A)) (A)) 'A) )
;; (print (main '(1 (2 (3))) 'A))

;;without MAP:

(defun removeall (l e)
    (cond
        ((null l) nil)
        ((equal (car l) e) (removeall (cdr l) e))
        ((listp (car l)) (cons (removeall (car l) e) (removeall (cdr l) e)))
        (T (cons (car l) (removeall (cdr l) e)))
    )
)

;; (print (removeall '(1 (2 A (3 A)) (A)) 'A) )
;; (print (removeall '(1 (2 (3))) 'A))

;;5) determine the number of sublists at any level of a given list,
;; where the last atom(at any level) is non-numeric

(defun linearize (l)
    (cond
        ((atom l) (list l))
        (T (mapcan #'linearize l))
    )
)

(defun last-atom (l)
    (cond
        ((null (cdr l)) (car l))
        (T (last-atom (cdr l)))
    )
)

(defun check(l)
    (not (numberp (last-atom (linearize l))))
)

;; (print (check '(6 f)))
;; (print (check '(d 1 (6 f))))

(defun determine(l)
    (cond
        ((atom l) 0)
        ((check l) (+ 1 (apply #'+ (mapcar #'determine l))))
        (T (apply #'+ (mapcar #'determine l)))
    )
)

;; (trace determine)
(print (determine '(A (B 2) (1 C 4) (D 1 (6 F)) ((G 4) 6)  ) ))