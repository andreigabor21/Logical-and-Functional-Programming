;;a) Write a function to return the n-th element of a list, or NIL if such an element does not exist.

(defun nth_elem(l n)
    (cond
        ((= n 1) (car l))
        ((null l) nil)
        (T (nth_elem (cdr l) (- n 1)) )
    )
)

(format t "nth element:~%")
(write (nth_elem '(1 2 3 4) 5))
( terpri)

;;b) Write a function to check whether an atom E is a member of a list which is not necessarily linear.

(defun contains(l e)
	(cond
		((null l) nil)
        ((listp (car l)) (or (contains (car l) e) (contains (cdr l) e) ) )
		((= (car l) e) T)
		(T (contains (cdr l) e))
	)
)

(format t "Member:")
(write (contains '(1 (8 (5 7 (7 4 2)) 3)) 4))
( terpri)

;;c) Write a function to determine the list of all sublists of a given list, on any level.
 ;;A sublist is either the list itself, or any element that is a list, at any level. Example:
 ;;(1 2 (3 (4 5) (6 7)) 8 (9 10)) => 5 sublists :
 ;;( (1 2 (3 (4 5) (6 7)) 8 (9 10)) (3 (4 5) (6 7)) (4 5) (6 7) (9 10) )


(defun all_lists(l first)
    (cond
        ((null l) nil) 
        ((= first 1) (cons l (all_lists l 0)) )
        ((listp (car l)) (append (all_lists(car l) 1) (all_lists(cdr l) 0) ) )
        (T (all_lists (cdr l) 0))
    )
)

(format t "Sublists:~%")
(write (all_lists '(1 2 (3 (4 5) (6 7)) 8 (9 10)) 1))
( terpri)

;;d) Write a function to transform a linear list into a set.
; (member 2 '(1 2 3)) =>  (2 3)   
(defun ltos(l)
    (cond
        ((null l) nil)
        ((not (member (car l) (cdr l) )) (cons (car l) (ltos (cdr l)) ) )
        (T (ltos (cdr l)))
    )
)

(write (ltos '(1 2 1 2 3 2)))