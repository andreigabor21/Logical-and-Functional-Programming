;;1. Write a function to check if an atom is member of a list (the list is non-liniar)

(defun _member(e L)
    (cond
        ((and (atom L) (= e L)) 1)
        ((null L) 0)
        ((atom L) 0)
        (T (apply #'+ (mapcar #'(lambda (l) (_member e l)) L)))
    )
)

(defun is_member(e L)
    (cond
        ((> (_member e L) 0) T)
        (T nil)
    )
)

;(trace _member)
(print (is_member '2 '((1 5) 4 3 4)))





;; (defun checkMember(e L)  ;;for linear
;;     (cond
;;         ((null L) nil)
;;         ((and (atom (car L)) (equal (car L) e) ) T)
;;         (T (checkMember e (cdr L)))
;;     )
;; )

;; (print (checkMember '2 '(1 (2) 3)))

(defun checkmember (l a)
 (let ((temp nil))
  (cond 
    ((null l) nil)
    ((find a l) (setf temp (or temp t)))
    (T (mapcar #'(lambda (x) (cond ((listp x)(setf temp (or temp (checkmember x a))))))
        l)
    )
  )
  temp)
)

(print (checkmember '(1 (7 4 (7 (2 8))) 3) '2 ))