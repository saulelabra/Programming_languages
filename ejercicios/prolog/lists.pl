/*
Examples of using list in Prolog
Saúl Enrique Labra Cruz
*/

%Last element in the list


%Base case, a list with only one element
tec_last([H | []], H).
%Recursive case
tec_last([_|T], L) :-
    tec_last(T, L).


%Length of list


%Base case
tec_length([] , 0).
%Recursive version
tec_length([_|T], L) :-
    tec_length(T, L1),
    L is L1 + 1.

%Tail recursion for finding the length of the list
tec_length_tail([], L, L).
tec_length_tail([_|T], A, L) :-
    A1 is A+1,
    tec_length_tail(T, A1, L).


%Reverse a list


tec_reverse(L, R) :-
    reverse_helper(L, R, []).
%Base case
reverse_helper([], R, R).
%Recursive rule
reverse_helper([H|T], R, A) :-
    reverse_helper(T, R, [H|A]).


%Append two lists


%Base case fact
tec_append([], L, L).
%Recursive rule
tec_append([H1|T1], L2, [H1|R]) :-
    tec_append(T1, L2, R).    


%Double the elements of a list


%Base case fact
double_elements([], []).
%Recursive rule
double_elements([H|T], [X|R]) :-
    X is H * 2,
    double_elements(T, R).

%Flatten a list that may contain other list
tec_flatten([], []).
%'\+'' means 'not', if x is not a list X becomes [X]
tec_flatten(X, [X]) :-
    \+ is_list(X).
tec_flatten([H|T], R) :-
    %is_list(H),
    tec_flatten(H, FlatHead),
    tec_flatten(T, FlatTail),
    append(FlatHead, FlatTail, R).

