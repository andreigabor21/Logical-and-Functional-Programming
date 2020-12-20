;;a) Write a function to return the product of all the numerical atoms from a list, at superficial level.

(defun prod(l)
    (cond 
        ((null l) 1)
        ((numberp (car l)) (* (car l) (prod (cdr l)) ) )
        (T (prod (cdr l)))
    )
)
(write (prod '(1 2 (3 10) 4 5)))
( terpri)

;;b) Write a function to replace the first occurence of an element E in a given list with an other element O.

(defun replace_first(l e o)
    (cond
        ((null l) nil)
        ((equal (car l) e) (cons o (cdr l)))
        (T (cons (car l) (replace_first (cdr l) e o)))
    )
)
(write (replace_first '(1 (2 3) 2 5 2 7) '2 '10))
( terpri)

(DEFUN replace2 (item repl L)
    (COND
        ((NULL L) NIL)
        ((EQUAL item (CAR L)) (CONS repl (replace2 item repl (CDR L))))
        ((ATOM (CAR L)) (CONS (CAR L) (replace2 item repl (CDR L))))
        (T (CONS (replace2 item repl (CAR L)) (replace2 item repl (CDR L)))) ;remove this line if is a linear list
    )
)

(PRINT (replace2 1 3 '(1 0 (0 1 (0 (1))) 0 1)))

;;c) Write a function to compute the result of an arithmetic expression memorised in preorder on a stack. Examples:
;; (+ 1 3) ==> 4 (1 + 3)
;; (+ * 2 4 3) ==> 11 [((2 * 4) + 3)
;; (+ * 2 4 - 5 * 2 2) ==> 9 ((2 * 4) + (5 - (2 * 2))

(defun operation(op a b)
    (cond 
        ((string= op "+") (+ a b))
        ((string= op "*") (* a b))
        ((string= op "-") (- a b))
        ((string= op "/") (floor a b))
    )
)

(defun evaluate(l)
    (cond
        ((null l) nil)
        ((and (atom (car l)) (numberp (cadr l)) (numberp (caddr l))) (cons (operation (car l) (cadr l) (caddr l)) (evaluate (cdddr l)) ) )
        (T (cons (car l) (evaluate (cdr l))) )
    )
)

(defun evaluate_rec(l)
    (cond
        ((null (cdr l)) (car l))
        (T (evaluate_rec (evaluate l)))
    )
)

(write (evaluate_rec '(+ * 2 4 - 5 * 2 2)))
( terpri)
;;d) Write a function to produce the list of pairs (atom n), where atom appears for n times in the parameter list. Example:
;; (A B A B A C A) --> ((A 4) (B 2) (C 1))

(defun count_atom(l e)
    (cond
        ((null l) 0)
        ((equal (car l) e) (+ 1 (count_atom (cdr l) e)) )
        (T (+ 0 (count_atom (cdr l) e)) )
    )
)
;(write (count_atom '(1 2 3 4 2 2) 2))

(defun remove_occurences(l e)
    (cond
        ((null l) nil)
        ((equal (car l) e) (remove_occurences (cdr l) e) )
        ((atom (car l)) (cons (car l) (remove_occurences (cdr l) e) ) )
        (T (cons (remove_occurences (car l) e) (remove_occurences (cdr l) e) ) )
    )
)

(format t "remove:~%")
(write (remove_occurences '(A B A (B A) C A) 'A))

(defun produce (l)
    (cond
        ((null l) nil)
        (T (cons (list (car l) (count_atom l (car l))) (produce (remove_occurences l (car l)))  )  ) 
    )
)

;(write (produce '(A B A B A C A)) )
