/*
Simple example of using arithmetic in Prolog
Saúl Enrique Labra Cruz
*/

%To make a query a variable has to be given to return the result
c_to_f(C, F) :-
    F is C * (9 / 5) + 32.

f_to_c(F, C) :-
    C is (F - 32) * 5 / 9.

quadratic(A, B, C, X1, X2) :-
    D is B * B - 4 * A * C,
    D >= 0,
    X1 is (-B + sqrt(D)) / (2 * A),
    X2 is (-B - sqrt(D)) / (2 * A).

%Factorial
%Base Case
factorial(0, 1).

%Recursive rule, N = Input, R = Result
factorial(N, R) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, S),%Inside parenthesis expressions are not valid, only variables
    R is N * S.

%Tail recursive factorial - is better for processing efficiency because function doesn't have to return to calling function
factorial(0, R, R).

factorial(N, A, R) :-
    N > 0,
    N1 is N - 1,
    A1 is A * N,
    factorial(N1, A1, R).