;;12. Write a function that substitutes an element through another one at all levels of a given list

(defun substitute-elems (list old-elem new-elem)
    (cond
        ((equal old-elem list) new-elem)
        ((atom list) list)
        (T (mapcar (lambda (lst) (substitute-elems lst old-elem new-elem)) list))
    )
)

(let ((list1 '(1 2 3 (1 2 (5 1 2)) 1 2))
      (list2 '(1 ((((((2)))))) 1 ((2) 2 (3 (2 2) 3 (1 2)))) ))
   (format t "a) Substitute ~d from the list ~s with ~d: " 1 list1 100)
   (print (substitute-elems '(1 2 3 (1 2 (5 1 2)) 1 2) 1 100))
   ( terpri) ( terpri)
   (format t "b) Substitute ~d from the list ~s with ~d: " 2 list2 99)
   (print (substitute-elems '(1 ((((((2)))))) 1 ((2) 2 (3 (2 2) 3 (1 2)))) 2 99))
)

#||
\[ 
substitute(list, old, new)= \left\{
\begin{array}{ll}
      new ,&old=list   \\
      list ,& list \ is \ an \ atom\\
      \bigcup\limits_{i=1}^{n} substitute(list_i,old,new)  ,& otherwise  \\
\end{array} 
\right. 
\]
||#