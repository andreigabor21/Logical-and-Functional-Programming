% flow model: (i,o)
element([H|_],H).
element([_|T],E):-
    element(T,E).


% make the "element" predicate return an element and the list without
% that element ->

%element2(L:list, E:element, R:list)
%flow model (i,o,o)

element2([H|T],H,T).
element2([H|T],E,[H|Rez]):-
    element2(T,E,Rez).


%generate(L:list,C:collector,D:direction,R:result)

generate(_,Cand,0,Cand).
generate(L,[H|Cand],0,R):-
    element2(L,E,Rest),
    E>H,
    generate(Rest,[E,H|Cand],0,R).
generate(L,[H|Cand],1,R):-
    element2(L,E,Rest),
    E < H,
    generate(Rest,[E,H|Cand],1,R).
generate(L,[H|Cand],1,R):-
    element2(L,E,Rest),
    E > H,
    generate(Rest,[E,H|Cand],0,R).

%start(L:list,Res:list)

start(L,Res):-
    element2(L,E1,R1),
    element2(R1,E2,Rest),
    E1 < E2,
    generate(Rest,[E1,E2], 1, Res).


startAll(L,Res):-
    findall(R,start(L,R),Res).









