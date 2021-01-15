(defun Fct(F L)
    (cond
        ((null L) nil)
        ((funcall F (car L)) (cons (funcall F (car L)) (Fct F (cdr L)) ) )
        (T nil)
    )
)

(defun F(x)
    (list x)
)

;(trace Fct)
;(print (Fct 'F '(1 2 3)) )

;;avoid the double call

;; In other to avoid evaluating an expression multiple times, simply bind the result of
;;  evaluating the expression to a symbol (lambda). Consider the following implementation which achieves the desired result:

(defun Fct2(F L)
    (funcall #'(lambda (x)
                    (cond
                        ((null L) nil)
                        (x (cons x (Fct2 F (cdr L)) ) )
                        (T nil)
                    )
                )
        (F (car L))
    )
) 

;; (trace Fct2)
;; (print (Fct2 'F '(1 2 3)) )


(defun fct-2 (func list)
    (when list
        (let ((head (funcall func (car list))))
            (when head
                (cons head (fct-2 func (cdr list)))))))

;; (print (fct-2 'F '(1 2 3)))

(defun g(L)
    (list (car L) (car L))
)

(setq Q 'G)
(setq P Q)

(print (funcall P '(A B C)) )

;; III
;; Replace all nodes from the odd leves in a tree with a given value e

(defun replace-odd(tree old-e new-e level)
    (cond
        ((and (oddp level) (atom tree)) new-e)
        ((atom tree) tree)
        (T (mapcar #'(lambda (Tree) 
                         (replace-odd Tree old-e new-e (1+ level)) 
         
                     ) 
                tree
           )
        )
    )
)

(print (replace-odd '(a (b (g)) (c (d (e)) (f))) 'e 'h -1) )