%pairs[A,B]: A<B
%[l1 l2 ... ln] -> [l_i l_j],i<j
% * a pair of [l2 ... ln]
%  * a pair of [l1 ... x], x from [l2 ... ln]

%pair(list,list)
pair([_|T],Res):-
    pair(T,Res).
pair([H|T],Res):-
    pair2(H,T,Res).

pair2(A,[B|_],[A,B]):-
    A<B.
pair2(A,[_|L],X):-
    pair2(A,L,X).

all_pairs(L,R):-
    findall(X,pair(L,X),R).


% Write a predicate to generate the list of all subsets with all
% elements of a given list.
% Eg: [2, 3, 4] N=2 => [[2,3],[2,4],[3,4]]

candidate([],[]).
candidate([H|T],[H|R]):-
    candidate(T,R).
%candidate([_|T],R):-
 %   candidate(T,R).

process(L,N,R):-
    candidate(L,R),
    length(R,N).

main(L,N,R):-
    findall(R1,process(L,N,R1),R).
