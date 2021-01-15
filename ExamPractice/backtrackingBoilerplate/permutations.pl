%Permutations
%------------

%del(N:number,L:list,R:result)
del(H,[H|T],T).
del(H,[H1|T],[H1|Res]):-
    del(H,T,Res).

%list_permutation(L:list,R:result)
list_permutation([],[]).
list_permutation(L,[X|Res]):-
    del(X,L,L1),
    list_permutation(L1,Res).


%or like this:

%insert_everywhere(E:number,L:list,Res:list)
%flow model: (i,i,o)
insert_everywhere(E,L,[E|L]).
insert_everywhere(E,[H|T],[H|Res]):-
    insert_everywhere(E,T,Res).

%perm(L:list,Res:list)
%flow model: (i,o)
perm([],[]).
perm([H|T],Res):-
    perm(T,Res1),
    insert_everywhere(H,Res1,Res).
