len([], 0).
len([_], 1).
len([_|T], X) :- len(T, A), X is A + 1.

test(X, A) :- X =.. B, A = B.

f(X, X).

:- op(650, xfx, suka).
:- op(100, yfx, dan).

unyil suka bakso.
unyil suka mie.
unyil suka coklat.
unyil suka bakso dan mie dan coklat.
iin suka tempe.

budi suka X :- unyil suka X.
budi suka X :- X suka tempe.