(defun parcurg_st(arb nv nm)
    (cond
        ((null arb) nil)
        ((equal nv (+ 1 nm)) nil)
        (T (cons (car arb) (cons (cadr arb) (parcurg_st (cddr arb) (1+ nv) (+ (cadr arb) nm)) ) ) )
    )
)

;(trace (parcurg_st))
;(print (parcurg_st '(b 2 c 1 i 0 f 1 g 0 d 2 e 0 h 0) 0 0) )
;( terpri)
 
(defun stang(arb)
    (parcurg_st (cddr arb) 0 0)
)

(print (stang ' (a 2 b 2 c 1 i 0 f 1 g 0 d 2 e 0 h 0) ) )

(defun parcurg_dr(arb nv nm)
    (cond
        ((null arb) nil)
        ((equal nv (+ 1 nm)) arb)
        (T (parcurg_dr (cddr arb) (1+ nv) (+ (cadr arb) nm)) )  
    )
)

(defun drept(arb)
    (parcurg_dr (cddr arb) 0 0)
)

(print (drept ' (a 2 b 2 c 1 i 0 f 1 g 0 d 2 e 0 h 0) )   )
( terpri)


(defun inordine(arb)
    (cond
        ((null arb) nil)
        (T (append (inordine(stang arb)) (list (car arb)) (inordine(drept arb))  ))
    )
)

(trace (inordine))
(inordine ' (a 2 b 2 c 1 i 0 f 1 g 0 d 2 e 0 h 0) )