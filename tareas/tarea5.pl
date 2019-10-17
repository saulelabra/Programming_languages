/*
Saúl Enrique Labra Cruz A01020725
A5_Prolog_basic
*/

%Determines if element "N" is inside the list provided
in_list([H|T], N) :-
    N = H;
    in_list(T, N).

%Get the length of a list
%Base case
tec_length([] , 0).
%Recursive version
tec_length([_|T], L) :-
    tec_length(T, L1),
    L is L1 + 1.

%Determine if the list length is an odd number or not
odd_length(E) :-
    tec_length(E, L),
    L mod 2 =:= 0.

%Get an element of the list at the index N
n_th_element(N, L, X) :-
    n_th_element_tail(N, L, X, 0).

n_th_element_tail(N, [H|_], X, N) :-
    X = H.
n_th_element_tail(N, [_|T], X, A) :-
    A1 is A+1,
    n_th_element_tail(N, T, X, A1).

%Determine if a list is a permutation of another
/*is_permutation([H|T],[H|T]) :-
    is_permutation(H, )*/