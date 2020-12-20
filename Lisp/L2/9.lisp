;9. Convert a tree of type (1) to type (2).

    ;;    A 
    ;;   / \
    ;;  B   C
    ;;     / \
    ;;    D   E 

;(A 2 B 0 C 2 D 0 E 0)  ->  (A (B) (C (D) (E)))

(defun convert (l stack)
    (cond
        ((null l) (car stack))
        ((and (numberp (car l) (= (car l) 0)) (convert (cons (list (cadr l)) (cddr l)) stack)) )
        ((and (numberp (car l) (= (car l) 1)) (convert (cons (list (car stack)) (cddr l)) stack)) )
        ((and (numberp (car l) (= (car l) 2)) (convert (cons (list (cadr l)) (cddr l)) stack)) )

    )
)