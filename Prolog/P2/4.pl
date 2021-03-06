%a. Write a predicate to determine the sum of two numbers written in
% list representation.

%normalize(+A:list, +B:list, -NA:list, -NB:list)

normalize(A,B,A,B):-
    length(A,L),
    length(B,L).
normalize(A,B,AR,BR):-
    length(A,LA),
    length(B,LB),
    LB < LA,
    normalize(A,[0|B],AR,BR).
normalize(A,B,AR,BR):-
    length(A,LA),
    length(B,LB),
    LB > LA,
    normalize([0|A],B,AR,BR).


%sum(+A:list, +B:list, -Carry:number, -R:list)

sum([H], [K], Carry, [Digit]):-
    Sum is H + K,
    Carry is Sum div 10,
    Digit is Sum mod 10,!.
sum([H|T],[K|TK],Carry,[Digit|R]):-
    sum(T,TK,Old_Carry,R),
    Sum is H + K + Old_Carry,
    Carry is Sum div 10,
    Digit is Sum mod 10.

%sum(+A:list,+B:list,-R:list)

sum(A,B,[1|R]):-
    normalize(A,B,AR,BR),
    sum(AR,BR,1,R).
sum(A,B,R):-
    normalize(A,B,AR,BR),
    sum(AR,BR,0,R).

% b. For a heterogeneous list, formed from integer numbers and list of
% digits, write a predicate to compute the sum of all numbers
% represented as sublists.

main([],[0]).
main([H|T],R):-
    is_list(H),
    main(T,Sum),
    sum(H,Sum,R).
main([H|T],R):-
    not(is_list(H)),
    main(T,R).

