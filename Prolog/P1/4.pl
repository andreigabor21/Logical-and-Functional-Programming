%a. Write a predicate to determine the difference of two sets.

%contains(E:element, L:list)

contains(H,[H|_]):-!.
contains(E,[_|T]):-
    contains(E,T).

%diff(S:set1,D:set2,R:result)

diff([],[],[]).
diff([],_,[]).
diff([H|T],D,R):-
    contains(H,D),!,
    diff(T,D,R).
diff([H|T],D,[H|R]):-
    diff(T,D,R).

% b. Write a predicate to add value 1 after every even element from a list.

addOne([],[]).
addOne([H|T],[H,1|R]):-
    H mod 2 =:= 0,!,
    addOne(T,R).
addOne([H|T],[H|R]):-
    addOne(T,R).
