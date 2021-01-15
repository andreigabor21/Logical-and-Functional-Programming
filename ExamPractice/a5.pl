f([],0).
f([H|T],S):-
    f(T,S1),
    H<S1,
    !,
    S is H+S1.
f([_|T],S):-
    f(T,S1),
    S is S1+2.


f2([],0).
f2([H|T],S):-
    f2(T,S1),
    aux(H,S1,S).
aux(H,S1,S):-
    H<S1,
    !,
    S is H+S1.
aux(_,S1,S):-
    S is S1+2.

p(1).
q(1).
r(1).
p(2).
q(2).
r(2).
s:-!,p(X),q(Y),r(Z),write(X),write(Y),write(Z),nl.


%II
% the list of all subsets with at least N elements, each subset having
% the sum divisible by 3.

len([],0).
len([_|T],R):-
    len(T,R1),
    R is R1+1.

sum([],0).
sum([H|T],S):-
    sum(T,S1),
    S is S1+H.

subsets([],[]).
subsets([_|T],R):-
    subsets(T,R).
subsets([H|T],[H|R]):-
    subsets(T,R).

generate(L,N,R):-
    subsets(L,R),
    len(R,Len),
    Len >= N,
    sum(R,S),
    S mod 3 =:=0.

main(L,N,Res):-
    findall(X,generate(L,N,X),Res).

