/*
	Simple example of Natural Language Processing
	Alberto Pascal
	A01023607
	2019/11/04
*/

%%% Vocabulary
article(mas, L0, L) :- terminal(el, L0, L).
article(fem, L0, L) :- terminal(la, l0, L).
noun(mas, L0, L) :- terminal(niño, L0, L).
noun(fem, L0, L) :- terminal(bici, L0, L).
verb(intransitive, L0, L) :- terminal(corree, L0, L).
verb(transitive, L0, L) :- terminal(monta, L0, L).

%%%Rules 
sentence(L0, L) :-
	noun_phrase(L0, L1), 
	verb_phrase(L1, L). 

noun_phrase(L0, L):-
	article(Genre, L0, L1), 
	noun(Genre, L1, L).

%Only a verb
verb_phrase(L) :-
	verb(V), 
	append(V, [], L).

verb_phrase(L):-
	verb(V), 
	noun_phrase(N), 
	append(V,N,L).