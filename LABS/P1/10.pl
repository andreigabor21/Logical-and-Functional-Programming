% a. Define a predicate to test if a list of an integer elements has a
% "valley" aspect (a set has a "valley" aspect if elements decreases up
% to a certain point, and then increases.
% eg: 10 8 6 9 11 13 – has a “valley” aspect


%valley(L:list, B:boolean)

valley([_],0):-!.
valley([H1,H2|T],1):-
    H1 > H2,
    !,
    valley([H2|T],1).
valley([H1,H2|T],_):-
    H1 < H2,
    !,
    valley([H2|T],0).



%b. Calculate the alternate sum of list’s elements (l1 - l2 + l3 ...).

%alernative(L:list, R:result)

alternative([],0):-!.
alternative([H],H):-!.
alternative([H1,H2|T],R):-
    alternative(T,R1),
    R is H1 - H2 + R1.
