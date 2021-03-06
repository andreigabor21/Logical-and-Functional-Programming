%a. Define a predicate to add after every element from a list, the divisors
%of that number

%Inserts the divisors(from 2 to N/2) of N at the beggining of L

insert_div(N,l_1...l_m,div) = l, N <= 2 or div > [N/2]
                              div + insert_div(N,l_1...l_m,div+1), N % div = 0
                              insert_div(N,l_1...l_m,div+1, otherwise

%insert_div(N:number, Div:number, L:list, R:list)
%(i,i,i,o)

insert_div(N,_,L,L):-
    N =< 2,!.
insert_div(N,Div,L,L):-
    Div > N/2, !.
insert_div(N,Div,L,[Div|Res]):-
    N mod Div =:= 0,
    !,
    NewDiv is Div+1,
    insert_div(N,NewDiv,L,Res).
insert_div(N,Div,L,Res):-
    NewDiv is Div+1,
    insert_div(N,NewDiv,L,Res).

%simplified
insert_divisors(N,L,Res):-insert_div(N,2,L,Res).


%Adds after every element of a list, its divisors

divisors(l_1...l_n) = [], n = 0
                      divisors(l_2...l_n) + l_1 + insert_div(l_1,l_2...l_n,2), otherwise

%divisors(L:list, Res:list)
%(i,o)

divisors([],[]).
divisors([H|T],[H|Res]):-
    divisors(T,Res1),
    insert_divisors(H,Res1,Res).


% b. For a heterogeneous list, formed from integer numbers and list of
% numbers, define a predicate to add in
%every sublist the divisors of every element.

heterList(l_1...l_n) = [], n= 0
                       divisors(l_1) + heterList(l_2...l_n), if l_1 is a list
                       l_1 + heterList(l_2...l_n), otherwise

%heterList(L:list, Res:list)
%(i,o)

heterList([],[]).
heterList([H|T],[Aux|Res]):-
    is_list(H),
    !,
    divisors(H,Aux),
    heterList(T,Res).
heterList([H|T],[H|Res]):-
    not(is_list(H)),
    !,
    heterList(T,Res).


% divisors([10,7,12],R).
% heterList([5,[12,4],7,[6]],R).
% heterList([5,[12,4],7,[]],R).
