;;Define a function which merges, without keeping the doubles, two sorted linear lists.

(defun merge (l1 l2)
    (cond
        ((null l2) l1)
        ((null l1) l2)
        ((< (car l1) (car l2)) (cons (car l1) (merge (cdr l1) l2)))
        ((> (car l1) (car l2)) (cons (car l2) (merge l1 (cdr l2))))
        (T (cons (car l1) (merge (cdr l1) (cdr l2))))
    )
)

(print (merge '(1 2 3) '(2 3 4 5)))


;;Define a function to remove all the occurrences of an element from a nonlinear list.

(defun removeAll (l e)
    (cond
        ((null l) nil)
        ((listp (car l)) (cons (removeAll (car l) e) (removeAll (cdr l) e)) )
        ((equal (car l) e) (removeAll (cdr l) e))
        (T (cons (car l) (removeAll (cdr l) e)))
    )
)

(print (removeAll '(1 2 (3 (2 9) 4 2 (5 2 7))) '2) )

;;Build a list with the positions of the minimum number from a linear list

(defun minim (l)
    (cond 
        ((null l) 10000)
        ((numberp (car l)) (min (car l) (minim (cdr l))))
        ((atom (car l)) (minim (cdr l)))
    )
)

(print (minim '(2 3 1 A 4)))

(defun positions (l e p)
    (cond
        ((null l) nil)
        ((equal (car l) e) (cons p (positions (cdr l) e (1+ p))))
        (T (positions (cdr l) e (1+ p)))
    )
)

(defun pozMain (l)
    (positions l (minim l) 1)
)

(print (pozMain '(2 3 1 4 1 5 1)) )

;;second opproach:

(defun pozMin (l minC pozC listPoz)
    (cond
        ((null l) listPoz)
        ((not (numberp (car l))) (pozMin (cdr l) minC (1+ pozC) listPoz))
        ((not (numberp minC)) (pozMin (cdr l) (car l) (1+ pozC) (list pozC)))
        ((= minC (car l)) (pozMin (cdr l) minC (+ pozC 1) (append listPoz (list pozC))))
        ((< (car l) minC) (pozMin (cdr l) (car l) (+ pozC 1) (list pozC)))
        (t (pozMin (cdr l) minC (+ pozC 1) listPoz))
    )
)

(defun pozMinMain (l)
    (pozMin l (car l) 1 nil)
)

(print (pozMinMain '(2 3 1 4 1 5 1)) )

;;Given a linear list, add element E on positions from N to N.

(defun addN (l e pc n)
    (cond
        ((null l) nil)
        ((equal 0 (mod pc n)) (cons e (addN l e (1+ pc) n)))
        (T (cons (car l) (addN (cdr l) e (1+ pc) n)))
    )
)

(defun addNMain (l e n)
    (addN l e 1 n)
)

(print (addNMain '(1 2 3 4 5) '10 '2))