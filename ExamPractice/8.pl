%2)
%remove N,2N,...

%remove_pos(L:list,P:pos,N:number,R:result)
%(i,i,i,o)
remove_pos([],_,_,[]).
remove_pos([_|T],P,N,R):-
    P = N,
    !,
    N1 is N*2,
    P1 is P+1,
    remove_pos(T,P1,N1,R).
remove_pos([H|T],P,N,[H|R]):-
    P1 is P+1,
    remove_pos(T,P1,N,R).

main(L,N,R):-remove_pos(L,1,N,R).


%3) list of subsets of even length

subsets([],[]).
subsets([H|T],[H|R]):-
    subsets(T,R).
subsets([_|T],R):-
    subsets(T,R).

len([],0).
len([_|T],L):-
    len(T,L1),
    L is L1+1.

even_sub(L,R):-
    subsets(L,R),
    len(R,Len),
    Len mod 2 =:= 0.

collect(L,R):-
    findall(X,even_sub(L,X),R).
