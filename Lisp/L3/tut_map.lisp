(defparameter *data* '())
(defparameter *data2* '())


(let ((l '(1 2 3 4 5) ))
    (print(map 'vector #'1+ l ))
) 

(let ((l '(1 2 3 4 5))
     (m '(6 7 8 9 10)))
    (print (map 'list #'(lambda (x y) `(,(1+ x) ,(1+ y))) l m) ) )

;; (let ((l '(1 2 3 4 5) ))
;;     (print (mapcar #'1+ l) )
;; )

;; (let ((l '(1 2 3 4 5) ))
;;     (print (mapcar #'(lambda (x) (* x x x)) l) )
;; )

;; (let ((l '(1 2 3 4 5) ))
;;     (print (mapc #'(lambda (x) (push (* x x x) *data*) ) l) )
;; )
;; (print *data*)


;; (let ((l '(1 2 3 4 5) )
;;      (m '(6 7 8 9 10 11)))
;;     (print (maplist #'(lambda (x y) `(,x ,y)) l m) )
;; )

;; (let ((l '(1 2 3 4 5) )
;;      (m '(6 7 8 9 10 11)))
;;     (print (mapl #'(lambda (x y) (push `(,x ,y) *data2*)) l m) )
;; )
;; (print *data2*)


(let ((l '(1 2 3 4 5) )
      (m '(6 7 8 9 10)) )
    (print (mapcan #'(lambda (x y) `(,x ,y)) l m) )
) 

(let ((l '(1 2 3 4 5) )
      (m '(6 7 8 9 10)) )
    (print (mapcar #'(lambda (x y) `(,x ,y)) l m) )
) 

(let ((l '(1 2 3 4 5) )
      (m '(6 7 8 9 10)) )
    (print (maplist #'(lambda (x y) `(,x ,y)) l m) )
) 

(let ((l '(1 2 3 4 5) )
      (m '(6 7 8 9 10)) )
    (print (mapcon #'(lambda (x y) `(,x ,y)) l m) )
) 
