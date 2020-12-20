;;a) Write a function to test whether a list is linear.
(defun is_linear(l)
    (cond
        ((null l) T)
        ((listp (car l)) nil)
        (T (is_linear (cdr l)) )
    )
)
(format t "Linear list:~%")
(format t "Is the list (1 2 3) linear? ~a ~%" (is_linear '(1 2 3)) )
(format t "Is the list (1 (2 6 7) 3 1) linear? ~a" (is_linear '(1 (2 6 7) 3 1)) )
( terpri)

;;b) Write a function to replace the first occurence of an element E in a given list with an other element O
;replace_first(l1l2..ln e o) =  o..ln , l1 = e
;                               l1 + replace_first(l2..ln e o) , l1 != e

(defun replace_first(l e o)
    (cond
        ((null l) nil)
        ((= (car l) e) (cons o (cdr l))  )
        (T (cons (car l) (replace_first (cdr l) e o) ))
    )
)
(format t "Replace first occurence of 2 with 5 in (1 2 3 2 4 2) -> ~a~%"  (replace_first '(1 2 3 2 4 2) 2 5) )

;c) Write a function to replace each sublist of a list with its last element.
; A sublist is an element from the first level, which is a list.
; Example: (a (b c) (d (e (f)))) ==> (a c (e (f))) ==> (a c (f)) ==> (a c f)
; (a (b c) (d ((e) f))) ==> (a c ((e) f)) ==> (a c f)

(defun find_last(l)
    (if (listp l)
        (find_last (car (reverse l)))
    l
    )
)

(defun replace_last(l)
    (cond
        ((null l) nil)
        ((listp (car l)) (cons (find_last (car l)) (replace_last (cdr l)) ))
        (T (cons (car l) (replace_last (cdr l))) )
    )
)
(format t "Replace sublist with last~%")
(write (replace_last '(a (b c) (d (e (f)))) ) )
( terpri)
(write (replace_last '(a (b c) (d ((e) f)))))
( terpri)
;(write (find_last '(d (e (f e)))  )  )

;;d) Write a function to merge two sorted lists without keeping double values

;; merge(l1l2..ln , k1k2...kn) =   nil, null(l) && null(k)
;;                                 l1 + merge(l2...ln, k1k2...kn), k is empty
;;                                 k1 + merge(l1...ln, k2...kn), l is empty
;;                                 l1 + merge(l2..ln , k1k2...kn)  , l1 < k1
;;                                  k1 + merge(l1..ln, k2..kn)   , l1 > k1

(defun merge_list(l k)
    (cond
        ((null l) k)
        ((null k) l)
        ((<= (car l) (car k)) (cons (car l) (merge_list (cdr l) k) ))
        (T  (cons (car k) (merge_list l (cdr k))) )
    )
)
;(write (merge_list '(1 4 4 5) '(2 3 6 7 7)))

(defun remove_duplicate(l)
    (cond
        ((null l) nil)
        ((= (length l) 1) (list (car l)) )
        ((= (car l) (cadr l)) (remove_duplicate(cdr l)))
        (T (cons (car l) (remove_duplicate (cdr l))))
    )
)
;(write (remove_duplicate '(1 2 2 3 4 4)))
(write (remove_duplicate (merge_list '(1 2 3 4 5) '(1 2 3 6 7) )))
