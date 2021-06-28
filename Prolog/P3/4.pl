%. The list a1... an is given. Write a predicate to determine all
% sublists strictly ascending of this list a

candidate([],[]).
candidate([H|T],[H|R]):-
    candidate(T,R).
candidate([_|T],R):-
    candidate(T,R).


%sorted(L:list)
sorted([_]):-!.
sorted([H1,H2|T]):-
    H1 =< H2,
    !,
    sorted([H2|T]).

process(L,Cand):-
    candidate(L,Cand),
    sorted(Cand).

main(L,R):-
    findall(Cand,process(L,Cand),R).
