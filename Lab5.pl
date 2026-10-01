
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% Abraham and Mona's children
parent(abraham, herb).
parent(mona, herb).
parent(abraham, homer).
parent(mona, homer).

% Clancy and Jackie's children
parent(clancy, marge).
parent(jackie, marge).
parent(clancy, patty).
parent(jackie, patty).
parent(clancy, selma).
parent(jackie, selma).

% Homer and Marge's children
parent(homer, bart).
parent(marge, bart).
parent(homer, lisa).
parent(marge, lisa).
parent(homer, maggie).
parent(marge, maggie).

% Selma's child
parent(selma, ling).


% --- RULES ---

father(X, Y) :- parent(X, Y), male(X).

mother(X, Y) :- parent(X, Y), female(X).

son(X, Y) :- parent(Y, X), male(X).

daughter(X, Y) :- parent(Y, X), female(X).

brother(X, Y) :- parent(Z, X), parent(Z, Y), male(X), X \= Y.

sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X), X \= Y.

grandfather(X, Z) :- male(X), parent(X, Y), parent(Y, Z).

aunt(X, Y) :- sister(X, Z), parent(Z, Y).

uncle(X, Y) :- brother(X, Z), parent(Z, Y).

cousin(X, Y) :- parent(A, X), parent(B, Y), (brother(A, B) ; sister(A, B)).

ancestor(X, Z) :- parent(X, Z).

ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).
