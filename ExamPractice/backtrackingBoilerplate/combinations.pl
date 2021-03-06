%Combinations
%------------
%Generating the combinations of N elements of the list [H|T]
% * If N=1, a possible combination is [H]
% * Generate a combination of N elements of T
% * Put H on the first position in a combination of N-1 elements of T

%[1,2,3],2 -> [1,2],[1,3],[2,3]
%comb(L:list,N:int,R:list_
%flow model: (i,i,o), (i,i,i)

comb([H|_],1,[H]).
comb([_|T],N,R):-
    comb(T,N,R).
comb([H|T],N,[H|R]):-
    N\=1,
    N1 is N-1,
    comb(T,N1,R).

combinations(L,N,R):-
    findall(X,comb(L,N,X),R).
