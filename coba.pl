len([], 0).
len([_], 1).
len([_|T], X) :- len(T, A), X is A + 1.

test(X, A) :- X =.. B, A = B.

f(X, X).

:- op(650, xfx, suka).
:- op(350, yfx, dan).

unyil suka bakso.
unyil suka mie.
unyil suka coklat.
iin suka tempe.

X suka Y dan Z :- X suka Y, X suka Z.

:- op(300, xfx, [are, is_a]).
:- op(300, fx, likes).
:- op(200, xfy, and).
:- op(100, fy, famous).

dub is_a famous wizard.
ani is_a witch.
harry is_a wizard and (likes q).
harry is_a (likes something).

harry and ron and hermione are friends.
