%a. Sort a list with removing the double values. E.g.: [4 2 6 2 3 4] --> [2 3 4 6]

len([],0).
len([_|T],Len):-
    len(T,Len1),
    Len is Len1 + 1.

%(i,i,o)
my_append([],E,[E]).
my_append([H|T],E,[H|R]):-
    my_append(T,E,R).

%merge (i,i,o) without keeping the doubles

merge([],[],[]):-!.
merge([],L2,L2):-!.
merge(L1,[],L1):-!.
merge([H1|T1],[H2|T2],[H1|R]):-
    H1 < H2,
    !,
    merge(T1,[H2|T2],R).
merge([H1|T1],[H2|T2],[H2|R]):-
    H2 < H1,
    !,
    merge([H1|T1],T2,R).
merge([H1|T1],[H2|T2],[H1|R]):-
    H2 = H1,
    !,
    merge(T1,T2,R).


% split(L1:list, L2:list, Left:list, Right:list)
% flow model: split(i, i, o, o)

split(L1,L2,L2,L1):-
    len(L1,Len1),
    len(L2,Len2),
    Diff is Len1 - Len2,
    abs(Diff,A),
    A =< 1,
    !.
split([H1|T1],L2,Left,Right):-
    my_append(L2,H1,App),
    split(T1,App,Left,Right).

split_final(L,Left,Right):-
    split(L,[],Left,Right).


%merge sort (i,o)

merge_sort([],[]):-!.
merge_sort([H],[H]):-!.
merge_sort(L,R):-
    split_final(L,Left,Right),
    merge_sort(Left,R1),
    merge_sort(Right,R2),
    merge(R1,R2,R).

% b. For a heterogeneous list, formed from integer numbers and list of
% numbers, write a predicate to sort every sublist with removing the
% doubles

heterList([],[]).
heterList([H|T],[Sorted|R]):-
    is_list(H),
    !,
    merge_sort(H,Sorted),
    heterList(T,R).
heterList([H|T],[H|R]):-
    heterList(T,R).
