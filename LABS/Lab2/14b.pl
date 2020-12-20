% Nth element in a list
% get_n(L: list, N: number, Res: number)
% get_n(i,i,0)
get_n([H|_],1,H):- !.
get_n([_|T],N,Res):- NewN is N-1,
                     get_n(T,NewN,Res).

%compute the sum of all elem of a list
%sum(L: list, Res: number)
%flow model: sum(i,o)  sum(i,i)
sum([],0).
sum([H|T],Res):- sum(T,Acc),
                 Res is Acc + H.
