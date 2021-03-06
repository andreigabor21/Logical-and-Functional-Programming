f([],0).
f([H|T],S):-
    f(T,S1),
    S1>2,
    !,
    S=S1+H.
f([_|T],S):-
    f(T,S1),
    S=S1+1.

f2([],0).
f2([H|T],S):-
    f(T,S1),
    aux(H,S1,S).
aux(H,S1,S):-
    S1>2,
    !,
    S=S1+H.
aux(_,S1,S):-
    S=S1+1.

%eliminare primele N numere prime ale unei liste

prime(N,_):-
    N>0,N=<3.
prime(N,Div):-
    N mod Div =\= 0,
    Div >= N/2,!.
prime(N,Div):-
    N mod Div =\= 0,
    NDiv is Div+1,
    prime(N,NDiv).

%elim(L:list,P:pos,N:number,R:result)
elim([],_,_,[]).
elim([H|T],P,N,R):-
    P =< N,
    prime(H,2),
    !,
    P1 is P+1,
    elim(T,P1,N,R).
elim([H|T],P,N,[H|R]):-
    P =< N,
    not(prime(H,2)),
    !,
    P1 is P+1,
    elim(T,P1,N,R).
elim([H|T],P,N,[H|R]):-
    P > N,
    !,
    elim(T,P,N,R).

main(L,N,R):-elim(L,0,N,R).


