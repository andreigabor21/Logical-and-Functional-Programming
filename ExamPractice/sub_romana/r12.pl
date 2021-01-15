sum(N,I,C,C):-!.
sum(N,I,C,R):-
    I mod 3 =:= 0,
    C1 is C+I,
    I1 is I+1,
    sum(N,I1,C1,R).
sum(N,I,C,R):-
    not(I mod 3 =:= 0),
    I1 is I+1,
    sum(N,I1,C,R).
