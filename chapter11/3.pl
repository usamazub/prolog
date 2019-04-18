:- dynamic memo/2.

sigma(A, Res) :-
    memo(A, Res),
    !.

sigma(1, 1) :- 
    assert(memo(1, 1)),
    !.

sigma(A, Res) :-
    X is A - 1,
    sigma(X, Temp),
    Res is A + Temp,
    assert(memo(A, Res)),
    !.