%occurences(L:list, E:number, Res)
occurences([], _, 0).
occurences([H|T], E, Res):-
    H = E,
    occurences(T, E, Res1),
    Res is Res1 + 1,
    !.
occurences([H|T], E, Res):-
    H \= E,
    occurences(T, E, Res).

%remove(list, copy, result).
remove([],_,[]).
remove([H|T],CP, [H|Res]):-
    occurences(CP,H,O),
    O > 1,
    remove(T, CP, Res),
    !.
remove([H|T],CP, Res):-
    occurences(CP,H,O),
    O == 1,
    remove(T, CP, Res).

remove_main(L, Res):-remove(L,L,Res).

%occurences_ac(L: list, E: el, Col:integer, Res: Integer)
occurences_ac([],_,Col,Res):-
    Res is Col.
occurences_ac([H|T],E,Col,Res):-
    H = E,
    Col1 is Col + 1,
    occurences_ac(T,E,Col1,Res),
    !.
occurences_ac([H|T],E,Col,Res):-
    H \= E,
    occurences_ac(T,E,Col,Res).
occurences_ac_final(L,E,Res):-
    occurences_ac(L,E,0,Res).

%addToEnd(list, elem, res) (i,i,o)
addToEnd([],E,[E]).
addToEnd([H|T],E,[H|Res]):-
    addToEnd(T,E,Res).

%removeC(L:list, CP:copy, Col:list, R:list)
%(i,i,i,o)
removeC([],_,Col,Res):-
    Res is Col.
removeC([H|T],CP,Col,Res):-
    occurences_ac(CP,H,0,Oc),
    Oc > 1,
    addToEnd(Col,H,Aux),
    removeC(T,CP,Aux,Res).
removeC([H|T],CP,Col,Res):-
    occurences_ac(CP,H,0,Oc),
    Oc =:= 1,
    removeC(T,CP,Col,Res).


removeC_final(L,Res):-removeC(L,L,[],Res).

%1 2 3 5 4 -> 2 3 5 4 -> 3 5 4 -> 5 4
%removeInc(List, Res).
removeInc([],[]).
removeInc([H],[H]).
removeInc([H1,H2],[]):-
    H1 < H2.
removeInc([H1,H2,H3|T], Res):-
    H1 < H2,
    H2 < H3,
    removeInc([H2,H3|T], Res).
removeInc([H1,H2,H3|T], Res):-
    H1 < H2,
    H2 >= H3,
    removeInc([H3|T], Res).
removeInc([H1,H2|T],[H1|Res]):-
    H1 >= H2,
    removeInc([H2|T],Res).
