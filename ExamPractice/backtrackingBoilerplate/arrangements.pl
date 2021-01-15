%Arrangements
%------------
%Generating the arrangements of N elements of the list [H|T]
% * If N=1, a possible arrangement is [H]
% * Generate an arrangement of N elements of the list T
% * Put H on every position in an arrangement of N-1 elements of T


%insert_everywhere(L:list,E:atom,R:list)
%flow model: (i,i,o), (i,i,i)

insert_everywhere([],E,[E]).
insert_everywhere([H|T],E,[E,H|T]).
insert_everywhere([H|T],E,[H|R]):-
    insert_everywhere(T,E,R).

%arr(L:list,N:int,R:list)
%flow model: (i,i,o), (i,i,i)

arr([H|_],1,[H]).
arr([_|T],N,R):-
    arr(T,N,R).
arr([H|T],N,R):-
    N \= 1,
    N1 is N-1,
    arr(T,N1,R1),
    insert_everywhere(R1,H,R).

arrangements(L,N,R):-
    findall(X,arr(L,N,X),R).
