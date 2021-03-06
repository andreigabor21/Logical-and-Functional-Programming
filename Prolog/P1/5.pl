%a. Write a predicate to compute the union of two sets.

removeOc(_,[],[]):-!.
removeOc(E,[H|T],R):-
    E = H,!,
    removeOc(E,T,R).
removeOc(E,[H|T],[H|R]):-
    E \= H,!,
    removeOc(E,T,R).


%union(Set1, Set2, Result)

unions([],[],[]).
unions([H|T],B,[H|R]):-
    removeOc(H,[H|T],R1),
    removeOc(H,B,R2),
    unions(R1,R2,R),!.
unions([],B,R):-
    unions(B,[],R),!.

% b. Write a predicate to determine the set of all the pairs of elements
% in a list. Eg.: L = [a b c d] => [[a b] [a c] [a d] [b c] [b d] [c
% d]].

/**
sets(l1...ln, k)=
                 [], k = 0
                 l1 + sets(l2...ln, k-1), k > 0
                 sets(l2...ln, k), k > 0
*/

sets(_,0,[]):-!.
sets([H|T],K,[H|R]):-
    K1 is K-1,
    sets(T,K1,R).
sets([_|T],K,R):-
    sets(T,K,R).


