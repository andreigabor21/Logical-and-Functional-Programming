% Write a predicate to generate the list of all subsets with all
% elements of a given list.
% Eg: [2, 3, 4] N=2 => [[2,3],[2,4],[3,4]]

candidate([],[]).
candidate([H|T],[H|R]):-
    candidate(T,R).
candidate([_|T],R):-
    candidate(T,R).

process(L,N,R):-
    candidate(L,R),
    length(R,N).

main(L,N,R):-
    findall(R1,process(L,N,R1),R).
