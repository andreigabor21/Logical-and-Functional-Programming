% maximum of a list
f([],0).
f([H|T],S):-
    f(T,S1),
    S1 < H,
    !,
    S is H.
f([_|T],S):-
    f(T,S1),
    S is S1.

f2([],0).
f2([H|T],S):-
    f(T,S),
    H < S,
    !.
f2([H|T],H).

% I.4
g([],[]).
g([H|T],[H|S]):-
    g(T,S).
g([H|T],S):-
    H mod 2 =:= 0,
    g(T,S).

% Permutations having the property that the absolute value of difference
% between two consecutive values is <= 3.

%difference(L:list).
%flow model: (i)
difference([_]):-!.
difference([H1,H2|T]):-
    Dif is abs(H1-H2),
    Dif =< 3,
    difference([H2|T]).

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
    insert_everywhere(H,Res1,Res),
    difference(Res).
