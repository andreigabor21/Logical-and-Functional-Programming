f([],-1).
f([H|T],S):-
    f(T,S1),
    S1>0,
    !,
    S is S1+H.
f([_|T],S):-
    f(T,S1),
    S is S1.

f2([],-1).
f2([H|T],S):-
    f(T,S1),
    aux(H,S1,S).

aux(H,S1,S):-
    S1>0,
    !,
    S is S1+H.
aux(_,S1,S):-
    S is S1.
