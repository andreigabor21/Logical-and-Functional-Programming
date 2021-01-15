%nrOccurrences(L:list, E:el, S:integer)
%flow model: (i,i,o) or (i,i,i)

nrOccurrences([],_,0).
nrOccurrences([H|T],E,S):-
    H = E,
    nrOccurrences(T,E,S1),
    S is S1 + 1.
nrOccurrences([H|T],E,S):-
    H \= E,
    nrOccurrences(T,E,S).

%remove(L:list, LO:list, R:List)
%flow model (i,i,o) or (i,i,i)

remove([],_,[]).
remove([H|T],LO,R):-
    nrOccurrences(LO,H,C),
    C = 1,
    remove(T,LO,R).
remove([H|T],LO,[H|R]):-
    nrOccurrences(LO,H,C),
    C \= 1,
    remove(T,LO,R).

removeMain(L,R):-remove(L,L,R).

% with collector:

%nrOccurrences(L:list,E:el,Col:integer,S:integer)

nrOccurrencesC([],_,Col,Col).
nrOccurrencesC([H|T],E,Col,S):-
    H = E,
    Col1 is Col+1,
    nrOccurrencesC(T,E,Col1,S).
nrOccurrencesC([H|T],E,Col,S):-
    H \= E,
    nrOccurrencesC(T,E,Col,S).

%addToEnd(L:list,E:elem,R:result) (i,i,o)

addToEnd([],E,[E]).
addToEnd([H|T],E,[H|R]):-
    addToEnd(T,E,R).

%removeC(L:list,LO:list,Col:list,R:list)

removeC([],_,Col,Col).
removeC([H|T],LO,Col,R):-
    nrOccurrencesC(LO,H,0,Count),
    Count = 1,
    removeC(T,LO,Col,R).
removeC([H|T],LO,Col,R):-
    nrOccurrencesC(LO,H,0,Count),
    Count \= 1,
    addToEnd(Col,H,Col1),
    removeC(T,LO,Col1,R).

removeCMain(L,R):-removeC(L,L,[],R).

%remove all increasing sequences
%removeInc(L:list,R:result)

removeInc([],[]).
removeInc([H],[H]).
removeInc([H1,H2],[]):-
    H1 < H2.
removeInc([H1,H2,H3|T],R):-
    H1 < H2,
    H2 < H3,
    removeInc([H2,H3|T],R).
removeInc([H1,H2,H3|T],R):-
    H1 < H2,
    H2 >= H3,
    removeInc([H3|T],R).
removeInc([H1,H2|T],[H1|R]):-
    H1 >= H2,
    removeInc([H2|T],R).

