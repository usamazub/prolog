:- dynamic memo/3.
:- dynamic ans/3.
:- dynamic here/1.

move(-1, -1).
move(-1, 0).
move(-1, 1).
move(0, -1).
move(0, 1).
move(1, -1).
move(1, 0).
move(1, 1).

valid(R, C) :-
    1 =< R, R =< 8,
    1 =< C, C =< 8.

grid(R, C) :-
    C =< 2, !, R =< 5.
grid(R, C) :-
    C =< 4, !, R =< 6.
grid(R, 5) :-
    !, R =< 7.
grid(R, 6) :-
    !, 3 =< R, R =< 7.
grid(R, 7) :-
    !, 5 =< R.
grid(R, 8) :-
    !, 7 =< R.

fill_ans(40) :-
    memo(R, C, -1),
    assert(ans(R, C, 40)), !.

fill_ans(Val) :-
    memo(R, C, Val),
    assert(ans(R, C, Val)),
    Num is Val + 1,
    fill_ans(Num).

remove(Min, Min) :-
    memo(R, C, Min),
    retract(memo(R, C, Min)), !.

remove(Min, Val) :-
    memo(R, C, Val),
    retract(memo(R, C, Val)),
    Num is Val - 1,
    remove(Min, Num), !.

remove(Min, Val) :-
    Num is Val - 1,
    remove(Min, Num).

iterate(_, _, 40) :-
    assert(here(100)),
    fill_ans(1), !.

iterate(R1, C1, Val1) :-
    assert(here(Val1)),
    valid(R1, C1),
    grid(R1, C1),
    \+ memo(R1, C1, _),
    move(A, B),
    R is R1 + A,
    C is C1 + B,
    Val is Val1 + 1,
    remove(Val1, 40),
    assert(memo(R1, C1, Val1)),
    iterate(R, C, Val).

configure(R1, C1, Val1, R2, C2, _) :-
    assert(memo(R1, C1, Val1)),
    assert(memo(R2, C2, -1)),
    move(A, B),
    R is R1 + A,
    C is C1 + B,
    Val is Val1 + 1,
    iterate(R, C, Val).

conf(Conf) :-
    setof((R, C, Val), ans(R, C, Val), Conf).

clear :-
    retractall(memo(_, _, _)),
    retractall(ans(_, _, _)).