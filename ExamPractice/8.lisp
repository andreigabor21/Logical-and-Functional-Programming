(defun delete (l i n)
    (cond
        ((null l) nil)
        ((equal (mod i n) 0) (delete (cdr l) (1+ i) n))
        (T (cons (car l) (delete (cdr l) (1+ i) n)))
    )
)

(defun wrapper (l n)
    (delete l 1 n)
)

;; (print (wrapper '(1 2 3 4 5) '2))

;; determine the number of sublists at any level of a given list, having
;; odd number of nonnumeric atoms on even levels

(defun count-atoms (l)
    (cond
        ((null l) 0)
        ((and (not (numberp l)) (atom l)) 1)
        ((atom l) 0)
        (T (apply #'+ (mapcar #'count-atoms l)))
    )   
)

(defun get-even-levels (l lvl)
    (cond
        ((and (atom l) (evenp lvl)) (list l))
        ((atom l) nil)
        (T (mapcan #'(lambda (lst) (get-even-levels lst (1+ lvl))) l))
    )
)

(defun check (l)
    (cond
        ((oddp (count-atoms (get-even-levels l 0))) T)
        (T nil)
    )
)

(defun count-lists (l)
    (cond
        ((atom l) 0)
        ((check l) (+ 1 (apply #'+ (mapcar #'count-lists l))))
        (T (apply #'+ (mapcar #'count-lists l)))
    )
)


(print (count-lists '(A (B 2) (1 C 4) (1 (6 F)) (((G) 4) 6))))





(defun countNNAtoms(l)
    (cond 
        ((NULL L) 0)
        ((AND (NOT (NUMBERP L)) (ATOM L)) 1)
        ((ATOM L) 0)
        (t (apply #'+ (mapcar #'countNNAtoms l)))
    )
)

(defun getEvenLevels(l level) 
    (cond 
        ((and (evenp level) (atom l)) (list l))
        ((atom l) nil)
        (t (apply #'append (mapcar (lambda (a) (getEvenLevels a (+ 1 level))) l)))
    )
)

;initial level is 0 because it enters the 3rd branch automatically
(defun check(l)
    (cond 
        ((= 1 (mod  (countNNAtoms (getEvenLevels l 0)) 2)) t)
        (t nil)
    )
)

(defun countSublists (l)
    (cond 
        (
            (and (listp l) (check l)) 
            (write l)
            (+ 1 (apply #'+ (mapcar #'countSublists l)))
            
        )
        ((atom l) 0)
        (t (apply #'+ (mapcar #'countSublists l) ))
    )
)

(defun main (l)
    (countSublists l)
)

(print (main '(A (B 2) (1 C 4) (1 (6 F)) (((G) 4) 6))))
