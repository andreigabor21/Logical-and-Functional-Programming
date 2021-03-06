%minimul unei liste de intregi

minim([A],A).
minim([H|T],Rez):-
    minim(T,M), %1
    H=<M,
    !,
    Rez=H.
minim([_|T],M):-
    minim(T,M). %2

%sol1
minim1([A],A).
ninim1([H|T],M):-
    minim1(T,M),
    H>M,!.
minim1([H|_],H).

%sol2

minim2([A],A).
minim2([H|T],Rez):-
    minim2(T,M),
    aux(H,M,Rez).

aux(H,M,Rez):-
    H=<M,
    !,
    Rez=H.
aux(_,M,M).


f([],-1).
f([H|T],S):-
    H>0,
    f(T,S1),
    S1<H,
    !,
    S is H.
f([_|T],S):-
    f(T,S1),
    S is S1.


% 1 2 4 1
f2([],-1).
f2([H|T],M):-
    H>0,
    f2(T,M),
    H<M,!.
f2([H|_],H).
