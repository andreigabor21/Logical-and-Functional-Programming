%a. Define a predicate to remove from a list all repetitive elements.
%Eg.: l=[1,2,1,4,1,3,4] => l=[2,3])

%countOcc(L:list,E:number,R:result)

countOcc([],_,0).
countOcc([H|T],E,R):-
    H = E,!,
    countOcc(T,E,R1),
    R is R1 + 1.
countOcc([H|T],E,R):-
    H \= E,!,
    countOcc(T,E,R).


%remove(L:list,E:element to be removed,R:result)

remove([],_,[]).
remove([H|T],E,R):-
    H = E,!,
    remove(T,E,R).
remove([H|T],E,[H|R]):-
    H \= E,!,
    remove(T,E,R).

%removeRep(L:list,R:result)

removeRep([],[]).
removeRep([H|T],R):-
    countOcc([H|T],H,Cnt),
    Cnt > 1,!,
    remove([H|T],H,Rem),
    removeRep(Rem,R).
removeRep([H|T],[H|R]):-
    countOcc([H|T],H,1),!,
    removeRep(T,R).

% b. Remove all occurrence of a maximum value from a list on integer
% numbers

max(A,B,A):-
    A > B,!.
max(A,B,B):-
    A =< B,!.

%findMax(L:lista,R:res)

findMax([H],H):-!.
findMax([H|T],M):-
     findMax(T,M1),
     max(H,M1,M).

%removeMax(L:list,R:res)
%
removeMax(L,R):-
    findMax(L,Max),
    remove(L,Max,R).
