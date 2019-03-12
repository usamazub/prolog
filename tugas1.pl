misteri(0, Y, Y).
misteri(s(X), Y, s(Z)) :- misteri(X, Y, Z).

% binary tree

% 1

mem(A, t(_, A, _)).
mem(A, t(L, _, _)) :- mem(A, L).
mem(A, t(_, _, R)) :- mem(A, R).

% 2

in(e, L, L).
in(t(L, X, R), Acc, E) :- in(R, Acc, P), in(L, [X|P], E).

in(T, E) :- in(T, [], E).