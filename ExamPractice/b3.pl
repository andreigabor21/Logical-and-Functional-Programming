f(1,1):-!.
f(K,X):-
    K1 is K-1,
    f(K1,Y),
    Y>1,
    !,
    K2 is K1-1,
    X is K2.
f(K,X):-
    K1 is K-1,
    f(K1,Y),
    Y>0.5,
    !,
    X is Y.
f(K,X):-
    K1 is K-1,
    f(K1,Y),
    X is Y-1.


f2(1,1):-!.
f2(K,X):-
    K1 is K-1,
    f2(K1,Y),
    aux(K1,Y,X).
aux(K1,Y,X):-
    Y>1,
    !,
    K2 is K1-1,
    X is K2.
aux(_,Y,X):-
    Y>0.5,
    !,
    X is Y.
aux(_,X,Y):-
    X is Y-1.


/**
%exemplu curs:

f(1,1):-!.
f(2,2):-!.

f(K,X):-
    K1 is K-1,
    f(K1,Y),
    Y > 1,
    !,
    K2 is K-2,
    X = K2.
f(K,X):-
    K1 is K-1,
    f(K1,X).

%Solution:

f2(1,1):-!.
f2(2,2):-!.

f2(K,X):-
    K1 is K-1,
    f2(K1,Y),
    aux(K,Y,X).
aux(K,Y,X):-
    Y > 1,
    !,
    K2 is K-2,
    X = K2.
aux(_,Y,Y).  */

%II
%arrangements with product smaller than V

product([],1).
product([H|T],R):-
    product(T,R1),
    R is R1 * H.

%InsertEvr(L:list, E:atom, R:list)
%flow model: (i,i,o)
insert_evr(L,E,[E|L]).
insert_evr([H|T],E,[H|R]):-
    insert_evr(T,E,R).

%arr(L:list,K:int,R:list)
%flow model (i,i,o)
arr([H|_],1,[H]).
arr([_|T],K,R):-
    arr(T,K,R).
arr([H|T],K,R):-
    K \= 1,
    K1 is K-1,
    arr(T,K1,R1),
    insert_evr(R1,H,R).

arrangements(L,K,V,R):-
    arr(L,K,R),
    product(R,Prod),
    Prod < V.

getAll(L,K,V,R):-
    findall(X,arrangements(L,K,V,X),R).


