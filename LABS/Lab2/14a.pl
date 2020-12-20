% EQUALITY OF TWO SETS

%length of a list:
%len(L:List,R:List)
%len(i,o).
len([],0).
len([_|T],R):- len(T,R1),
               R is R1+1.

%list contains elem
%contains(L:List, E:number)
%len(i,i)
contains([H|_],H):- !.
contains([_|T],E):- contains(T,E).


%remove all occurences of E in a list
%remove(L:List, E:number, Res:list)
%remove(i,i,0)
remove([],_,[]).
remove([H|T],E,[H|Res]):- not(H =:= E),
                          !,
                          remove(T,E,Res).
remove([_|T],E,Res):- remove(T,E,Res).

%check if set A equals set B
%sets(A: list, B: list)
%sets(i,i)

sets([],[]).
sets([HA|TA],[HB|TB]):-len([HA|TA],LA),
                       len([HB|TB],LB),
                       LA =:= LB,
                       contains([HA|TA],HB),
                       contains([HB|TB],HA),
                       remove(TA,HB,RA),
                       remove(TB,HA,RB),
                       sets(RA,RB).











