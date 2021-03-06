%a. Write a predicate to test if a list is a set.

%countOcc(E:number, L:list, R:result)

countOcc(_,[],0):-!.
countOcc(E,[H|T],R):-
    E = H,
    !,
    countOcc(E,T,R1),
    R is R1+1.
countOcc(E,[H|T],R):-
    E \= H,
    !,
    countOcc(E,T,R).

%isSet(L:list)

isSet([]).
isSet([H|T]):-
    countOcc(H,[H|T],R),
    R =:= 1,
    !,
    isSet(T).

%removeKOcc(L:list, E:number, K:number, R:result)

removeKOcc([],_,_,[]):-!.
removeKOcc(L,_,0,L):-!.
removeKOcc([H|T],E,K,R):-
    H =:= E,
    K1 is K-1,
    removeKOcc(T,E,K1,R).
removeKOcc([H|T],E,K,[H|R]):-
    H \= E,
    removeKOcc(T,E,K,R).


remove3Occ(L,E,R):-removeKOcc(L,E,3,R).




