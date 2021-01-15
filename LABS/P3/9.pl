%Generate all permutation of N (N - given) respecting the property: for
% every 2<=i<=n exists an 1<=j<=i,so |v(i)-v(j)|=1.

del(H,[H|T],T).
del(E,[H|T],[H|T1]):-
    del(E,T,T1).

list_permutation([],[]).
list_permutation(L,[X|P]):-
    del(X,L,L1),
    list_permutation(L1,P).
