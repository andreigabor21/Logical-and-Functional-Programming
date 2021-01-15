%Subsets
%If the list is empty, a subsets of it is the empty list
%Generating the subsets of the list [H|T]:
%    i) generate a subset of the list T
%    ii) put E on the first position in a subset of L


%subset(L:list,R:list)
%flow model:(i,o),(i,i)
subsets([],[]).
subsets([H|T],[H|R]):-  %includes first element
    subsets(T,R).
subsets([_|T],R):-   %does not include first element
    subsets(T,R).


subsetsCol(L,R):-
    findall(X,subsets(L,X),R).



%subsets of sum S
%----------------

%subsetsSum(L:list,S:int,R:list)
%flow model:(i,i,o), (i,i,i)

subsetsSum([],0,[]).
subsetsSum([H|T],S,[H|R]):-
    H =< S,
    S1 is S-H,
    subsetsSum(T,S1,R).
subsetsSum([_|T],S,R):-
    subsetsSum(T,S,R).


sum_main(L,S,R):-
    findall(X,subsetsSum(L,S,X),R).
