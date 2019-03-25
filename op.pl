% Exercise 9.3

termtype(X, var) :- var(X).
termtype(X, nonvar) :- nonvar(X).
termtype(X, compound) :- compound(X).
termtype(X, atom) :- atom(X).
termtype(X, integer) :- integer(X).
termtype(X, float) :- float(X).
termtype(X, number) :- number(X).
termtype(X, atomic) :- atomic(X).
termtype(_, term).

groundterm(X) :- check_vars()
