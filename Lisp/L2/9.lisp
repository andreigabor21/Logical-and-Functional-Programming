;9. Convert a tree of type (1) to type (2).

    ;;    A 
    ;;   / \
    ;;  B   C
    ;;     / \
    ;;    D   E 

;(A 2 B 0 C 2 D 0 E 0)  ->  (A (B) (C (D) (E)))

(defun _convert (l stack)
	(cond
		((null l) (car stack))

		((and (numberp (car l)) (= (car l) 0)) (_convert (cons (list (cadr l)) (cdr (cdr l))) stack))
		((and (numberp (car l)) (= (car l) 1)) (_convert (cons (list (car stack) (cadr l)) (cdr (cdr l))) (cdr stack)))
		((and (numberp (car l)) (= (car l) 2)) (_convert (cons (list (cadr stack) (car stack) (cadr l)) (cdr (cdr l))) (cdr (cdr stack))))

		(T (_convert (cdr l) (cons (car l) stack)))
	)
)

(defun reverse_lists(L)
	(cond
		((null L) nil)
		((listp (car l)) (cons (reverse_lists (reverse (car L))) (reverse_lists (cdr L)) ))
		(T (cons (car L) (reverse_lists (cdr L)) ) )
	)
)

; convert(l) => converted list
; convert(l1..ln) = reverse(convert(reverse(l), nil)))
(defun convert (l)
	(reverse_lists(reverse (_convert (reverse l) nil)))
)

(print (convert '(A 0)))
; => '(A)
(print (convert '(A 1 B 0)))
; => '(A (B))
(print (convert '(A 2 B 1 C 2 D 0 E 0 F 1 G 0)))
; => (A (B (C (D) (E))) (F (G)))
(print (convert '(A 2 B 0 C 2 D 0 E 0)))
; => '(A (B) (C (D) (E)))