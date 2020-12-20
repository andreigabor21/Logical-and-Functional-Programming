(format t "5+2=~d ~%" (+ 5 2))

(defun fct(l)
    (cdr l)
)

;(write (fct '(1 2)))

;;Să se calculeze suma atomilor numerici de la nivelul superficial dintr-o listă
;;neliniară .

(defun suma(l)
    (cond
        ((null l) 0)
        ((numberp (car l)) (+ (car l) (suma(cdr l))))
        (t (suma (cdr l)))
    )
)

;; orice nivel
(defun suma2(l)
    (cond
        ((null l) 0)
        ( (numberp (car l)) (+ (car l) (suma2 (cdr l))) )
        ( (atom (car l)) (suma2 (cdr l)) )
        (t (+ (suma2(car l)) (suma2 (cdr l))))
    )

)

(write(suma '(1 (2 (3 4) 5) 1))) ;2
(format t "~%")
(write(suma2 '(1 (2 (3 4) 5) 1))) ;2
(format t "~%")


(defun maxn(x y)
    (cond
        ( (> x y) x )
        ( T y )
    )
)

(defun ultim(l)
    (cond
        ((atom l) l)
        ((null (cdr l)) (car l))
        (T (ultim(cdr l)))
    )
)

(defun suma(l)
    (cond
        ((null l) 0)
        ( (numberp (car l)) (+ (car l) (suma(cdr l))) )
        ((atom (car l)) (suma(cdr l)))
        (T (+ (suma (car l)) (suma (cdr l))))
    )
)


(defun adaug(e l)
    (cond 
        ((null l) (list e))
        (T (cons (car l) (adaug e (cdr l))))
    )
)

;(write (adaug '3 '(1 2)))

(defun invers(l) 
    (cond 
        ((atom l) l)
        (T (append (invers (cdr l)) (list (car l)) ) )
    )
)

;(write (invers '(1 2 3)))

(defun invers_aux(l col)
    (cond
        ((null l) col)
        (T (invers_aux (cdr l) (cons (car l) col)) )
    )
)
(defun invers_2(l)
    (invers_aux l ())
)

;(write (invers_2 '(1 2 3)))


(defun lista(e l)
    (cond 
        ((null l) nil)
        (T (cons (list e (car l)) (lista e (cdr l)) ))
    )
)

;(write (lista 'A '(B C D)))

(defun per(e l)
    (cond
        ((null l) nil)
        ((< e (car l)) (cons (list e (car l)) (per e (cdr l)) ))
        (T (per e (cdr l)))
    )
)

;(write (per '2 '(3 1 5 0 4)))

(defun perechi (l)
 (cond
    ((null l) nil)
    (T (append (per (car l) (cdr l)) (perechi (cdr l)) ))
 )
)

;(write (perechi '(3 1 5 0 4)) )

(defun dublare(l)
    (cond 
        ((null l) nil)
        ((numberp (car l)) (cons (* 2 (car l)) (dublare (cdr l) )) )
        ((atom (car l)) (cons (car l) (dublare (cdr l)) ) )
        (T (cons (dublare (car l)) (dublare (cdr l)) ) )
    )
)

(write (dublare '(1 b 2 (c (3 h 4)) (d 6)) ))
( terpri)

(defun dublare_2(l)
    (cond
        ((numberp l) (* 2 l))
        ((atom l) l)
        (T (cons (dublare_2 (car l)) (dublare_2 (cdr l)) ))
    )
)

(write (dublare_2 '(1 b 2 (c (3 h 4)) (d 6)) ))
( terpri)


(defun lista(l)
    (cond
        ((null l) nil)
        ((numberp (car l)) (cons (car l) (lista (cdr l))))
        (T (lista (cdr l)))
    )
)

(write (lista '(1 a 2 b 3 c)))
( terpri)

(defun lista_aux(l col)
    (cond 
        ((null l) col)
        ((numberp (car l)) (lista_aux (cdr l) (append col (list (car l)))))
        (T (lista_aux (cdr l) col))
    )
)

(defun lista2(l) 
    (lista_aux l nil)
)
;(write (lista2 '(1 a 2 b 3 c)))


(defun parcurg_aux(L k col)
    (cond
        ((null l) nil)
        ((= k 0) (list col L))
        (T (parcurg_aux (cdr L) (- k 1) (cons (car l) col) ))
    )
)

(defun parcurg(L k)
    (parcurg_aux L 2 nil)
)

(write (parcurg '(1 2 3 4 5) 3))
