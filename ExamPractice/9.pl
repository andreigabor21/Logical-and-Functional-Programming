f([],0).
f([H|T],S):-
    f(T,S1),
    %S1 is S-H.
    S is S1-H.


%rec(L:list,Acc:list accumulator,R:result list)
%(i,i,o) -> (i,[],o)
rev([],Acc,Acc).
rev([H|T],Acc,R):-
    not(is_list(H)),
    !,
    rev(T,[H|Acc],R).
rev([H|T],Acc,R):-
    rev(H,[],R1),
    rev(T,[R1|Acc],R).


%combinations
%comb(L:list,N:number,R:result list)
%(i,i,o)

comb([H|_],1,[H]).
comb([_|T],N,R):-
    comb(T,N,R).
comb([H|T],N,[H|R]):-
    N \= 1,
    N1 is N-1,
    comb(T,N1,R).

allComb(L,N,R):-
    findall(X,comb(L,N,X),R).
