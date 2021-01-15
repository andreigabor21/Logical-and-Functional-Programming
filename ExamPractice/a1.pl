f2([],-1).
f2([H|T],M):-
    H>0,
    f2(T,M),
    H<M,!.
f2([H|_],H).

f([],0).
f([H|T],S):-
    f(T,S1),
    S1 is S-H.  %error arguments not sufficiently instantiated


%arrangements with product P

%product(L:list,R:number)
%flow model: (i,o), (i,i)
product([],1).
product([H|T],R):-
    product(T,R1),
    R is R1*H.

%insert_everywhere(E:number,L:list,R:result)
insert_everywhere(E,[],[E]).
insert_everywhere(E,[H|T],[E,H|T]).
insert_everywhere(E,[H|T],[H|R]):-
    insert_everywhere(E,T,R).

%arr(L:list,K:number,P:number,R:result)
%flow model: (i,i,o)
arr([H|_],1,_,[H]).
arr([_|T],K,P,R):-
    arr(T,K,P,R).
arr([H|T],K,P,R):-
    K1 is K-1,
    arr(T,K1,P,R1),
    insert_everywhere(H,R1,R),
    product(R,Prod),
    Prod =:= P.

arrangementsProd(L,K,P,R):-
    findall(X,arr(L,K,P,X),R).
