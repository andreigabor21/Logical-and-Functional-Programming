% power in 2 ways:

pow(_,0,1):-!.
pow(X,Y,Z) :- Y1 is Y - 1,
              pow(X,Y1,Z1), Z is Z1*X.
%second with tail recursion
pow3(X,Y,Z):-powend(X,Y,1,Z),!.

powend(_,0,A,Z):-Z is A.
powend(X,Y,A,Z):-Y1 is Y-1,
                 A1 is A*X,
                 powend(X,Y1,A1,Z).
