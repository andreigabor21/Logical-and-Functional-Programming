f([],0).
f([H|T],P):-
    H mod 2 =\= 0,
    !,
    f(T,P1),
    P is P1+1.
f([_|T],P):-f(T,P1),P is P1.
