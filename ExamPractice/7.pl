f([],-1).
f([H|T],S):-
    f(T,S1),
    S1>0,
    !,
    S is S1 + H.
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
aux(_,S1,S1).

%2)

search([E|_],E):-!.
search([_|T],E):-
    search(T,E).

make_set([],[]).
make_set([H|T],[H|R]):-
    not(search(T,H)),
    !,
    make_set(T,R).
make_set([_|T],R):-
    make_set(T,R).

% second approach

delete([],_,[]).
delete([H|T],E,[H|R]):-
    H \= E,
    !,
    delete(T,E,R).
delete([_|T],E,R):-
    delete(T,E,R).

to_set([],[]).
to_set([H|T],[H|R]):-
    delete(T,H,R1),
    to_set(R1,R).

%3) arrangemenets of product P

product([],1).
product([H|T],R):-
    product(T,R1),
    R is R1*H.

%insert_evr(L:list,E:number,R:result list)
insert_evr(L,E,[E|L]).
insert_evr([H|T],E,[H|R]):-
    insert_evr(T,E,R).

%arr(L:list,K:number,R:result list)
arr([H|_],1,[H]).
arr([_|T],K,R):-
    arr(T,K,R).
arr([H|T],K,R):-
    K \= 1,
    K1 is K-1,
    arr(T,K1,R1),
    insert_evr(R1,H,R).

generate(L,K,P,R):-
    arr(L,K,R),
    product(R,P).

main(L,K,P,R):-
    findall(X,generate(L,K,P,X),R).
