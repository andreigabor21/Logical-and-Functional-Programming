%Computes the length o a list
%flow model (i,o)
leng([],0).
leng([_|T],Res):-
leng(T,Res1),
Res is Res1+1.

%Checks if three points are collinear
%flow model(i,i,i)
coliniare([X,_],[X,_],[X,_]):-!.
coliniare([_,Y],[_,Y],[_,Y]):-!.
coliniare([X1,Y1],[X2,Y2],[X3,Y3]):-
    (Y3-Y1)/(Y2-Y1) =:= (X3-X1)/(X2-X1).

%Checks if all points from a list are collinear
%flow model (i)
coliniare_all([H1,H2,H3]):-
    coliniare(H1,H2,H3),!.
coliniare_all([H1,H2,H3|T]):-
    coliniare(H1,H2,H3),
    coliniare_all([H2,H3|T]).

%Check if the length of a list is bigger or equal to 3
%flow model (i)
len_b3(L):-
    leng(L,R),
    R >= 3.

%Determines the subsets of a list
%flow model (i,o)
subsets([],[]).
subsets([H|T],[H|Res]):-
    subsets(T,Res).
subsets([_|T],Res):-
    subsets(T,Res).

%Puts the constraints on candidate solutions
%flow model(i,o)
find_sol(L,Aux):-
    subsets(L,Aux),
    len_b3(Aux),
    coliniare_all(Aux).

%Accumulates all the partial results in a list
getAll(L,Res):-
      findall(Partial,find_sol(L,Partial),Res).

%Prints all the partial results
print_sol(L):-
    find_sol(L,P),
    write(P),
    nl,
    fail.

%print_sol([[1,1],[2,2],[8,3],[4,4],[5,5]]).
%print_sol([[1,1],[2,2],[8,3],[4,4],[5,5],[9,3],[10,3]]).
%print_sol([[1,1],[3,5],[7,2]]).





