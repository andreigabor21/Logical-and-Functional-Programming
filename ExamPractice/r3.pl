%add in list after positions 3,5,7,17...

%add(L:list,P:current pos,N:power of 2,E:number,R:result list)
%(i,i,i,o)

add([],_,_,_,[]).
add([H|T],P,N,E,[H,E|R]):-
    P =:= N+1,
    !,
    P1 is P+1,
    N1 is N*2,
    add(T,P1,N1,E,R).
add([H|T],P,N,E,[H|R]):-
    not(P =:= N+1),
    P1 is P+1,
    add(T,P1,N,E,R).

main(L,E,R):-
    add(L,1,2,E,R).

%lista permutarilor N,N+1,...,2N-1 cu |a(i)-a(i+1)|<=2

candidat(N,N,_).
candidat(E,N,M):-
    N>M,
    N1 is N-1,
    candidat(E,N1,M).

apare(_,[]):-false.
apare(E,[H|_]):-
    E =:= H,!.
apare(E,[_|T]):-
    apare(E,T).

perm(N,C):-
    N1 is 2*N-1,
    candidat(E,N1,N),
    perm_aux(N,C,[E],1).

perm_aux(N,C,C,N):-!.
perm_aux(N,C,[H|T],Lg):-
    Lg < N,
    N1 is 2*N-1,
    candidat(E,N1,N),
    \+ apare(E,[H|T]),
    abs(H-E) =< 2,
    Lg1 is Lg+1,
    perm_aux(N,C,[E,H|T],Lg1).

main(N,R):-
    findall(X,perm(N,X),R).

