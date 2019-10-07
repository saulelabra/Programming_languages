/*
Program to establish family relationships between persons
Source of the data:
    https://dragonball.fandom.com/wiki/Bardock

Gilberto Echeverria
02/10/2019
*/

% Facts
father(goku, gohan).
father(goku, goten).
father(bardock, goku).
father(bardock, raditz).
father(vegeta, trunks).
father(vegeta, bulla).
father(dr_brief, bulma).
mother(gine, goku).
mother(gine, raditz).
mother(chichi, gohan).
mother(chichi, goten).
mother(bulma, trunks).
mother(bulma, bulla).
mother(panchy, bulma).
male(bardock).
male(goku).
male(vegeta).
male(gohan).
male(goten).
male(trunks).
female(gine).
female(chichi).
female(bulma).
female(bulla).

%Rules
brothers(X, Y) :-
    father(Z, X),
    father(Z, Y),
    mother(W, X),
    mother(W, Y),
    X \= Y.

brother(X, Y) :-
    brothers(X, Y),
    male(Y).

sister(X, Y) :-
    brothers(X, Y),
    female(Y).

/*It is possible to have the same name with different functions as long as they are contiguous
They execute sequentialy*/

grandfather(X, Y) :-
    male(X),% X is male
    father(Z,Y),% Z is father of Y
    father(X,Z). % X is father of Z

grandfather(X, Y) :-
    father(X, Z),
    mother(Z, Y).

grandfather(X, Y) :-
    father(X, Z),
    father(Z, Y).

grandmother(X, Y) :-
    female(X),% X is female
    father(Z,Y),% Z is mother of Y
    father(X,Z). % X is mother of Z

grandchild(X, Y) :-
    grandfather(Y, X);
    grandmother(Y, X).

grandson(X, Y) :-
    male(X),
    grandchild(X, Y).

granddaughter(X, Y) :-
    female(X),
    grandchild(X, Y).