/*
Saúl Enrique Labra Cruz A01020725
A5_Prolog_basic
*/

%Determines if element "N" is inside the list provided
in_list([H|T], N) :-
    N = H;
    in_list(T, N).

%Determines if element "N" is inside the list provided and return index
in_list_index([H|T], N, C, I) :-
    N = H,
    I = C;
    C1 is C + 1,
    in_list_index(T, N, C1, I).

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

%Delete element at index i
delete_element([_|T], L2, N, N) :-
    L2 = T.
delete_element([H|T], L2, N, C) :-
    C1 is C + 1,
    delete_element(T, L, N, C1),
    append([H], [L], R),
    flatten(R, L2).

%Determine if a list is a permutation of another
is_permutation([],[]).
is_permutation([H|T], L2) :-
    in_list_index(L2, H, 0, I),
    delete_element(L2, LR, I, 0),
    is_permutation(T, LR).

%Remove repeated elements from a list
remove_doubles(L,R) :-
    remove_doubles_p(L,R1),
    flatten(R1,R).

remove_doubles_p([X],[X]).

remove_doubles_p([H1,H2|T],R) :-
    H1 \= H2,
    L = [H2, T],
    flatten(L, Lf),
    remove_doubles_p(Lf,R1),
    R = [H1, R1].

remove_doubles_p([_,H2|T],R) :-
    flatten([H2,T],L),
    remove_doubles_p(L, R).
    
