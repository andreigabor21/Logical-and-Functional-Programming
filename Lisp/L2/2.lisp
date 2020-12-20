;;function to traverse the left subtree
(defun traverse_left(arb nv nm)
    (cond
        ((null arb) nil)
        ((equal nv (1+ nm)) nil)
        (T (cons (car arb) (cons (cadr arb) (traverse_left (cddr arb) (1+ nv) (+ (cadr arb) nm)) ) ) )
    )
)

(defun left(arb)
    (traverse_left (cddr arb) 0 0)
)

;;functions to traverse the right subtree
(defun traverse_right(arb nv nm)
    (cond
        ((null arb) nil)
        ((equal nv (+ 1 nm)) arb)
        (T (traverse_right (cddr arb) (1+ nv) (+ (cadr arb) nm)) )  
    )
)

(defun right(arb)
    (traverse_right (cddr arb) 0 0)
)

(defun kthLevel(tree level k) 
    (cond
        ((null tree) nil)
        ((equal level k) (list (car tree)) )
        (T (append (kthLevel (left tree) (1+ level) k) (kthLevel (right tree) (1+ level) k) ))
    )
)

    ;;    A 
    ;;   / \
    ;;  B   C
    ;;     / \
    ;;    D   E

(print (kthLevel '(A 2 B 0 C 2 D 0 E 0) 0 0) )


;; traverse_left(l1l2...ln, nv, nm) = {
;;                                         0, l is empty
;;                                         l, nv = nm + 1
;;                                         l1 + l2 + traverse_left(l3...ln, nv+1, nm+l2), otherwise
;;                                     }


;; traverse_right(l1l2...ln, nv, nm) = {
;;                                         0, l is empty
;;                                         0, nv = nm + 1
;;                                         traverse_left(l3...ln, nv+1, nm+l2), otherwise
;;                                     }

;; kthLevel(t1t2...tn, level, k) = { 
;;                 nil, tree is empty
;;                 t1, level = k
;;                 kthLevel(left(t1...tn), level+1, k) + kthLevel(right(t1...tn), level+1, k), otherwise
;;                 }
