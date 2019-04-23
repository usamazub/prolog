:- dynamic memo/3.
:- dynamic ans/3.

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

remove(40) :- !.

remove(Now) :-
    retractall(memo(_, _, Now)), !,
    Next is Now + 1,
    remove(Next).

remove(_).

iterate_ans(40) :- !.

iterate_ans(Now) :-
    ans(_, _, Now), !,
    Next is Now + 1,
    iterate_ans(Next).

iterate_ans(Now) :-
    memo(R, C, Now),
    assert(ans(R, C, Now)),
    Next is Now + 1,
    iterate_ans(Next).

iterate(_, _, 41) :-
    iterate_ans(1), !.

iterate(R_now, C_now, Val_now) :-
    remove(Val_now),
    valid(R_now, C_now),
    grid(R_now, C_now),
    ans(_, _, Val_now), !,
    ans(R_now, C_now, Val_now),
    assert(memo(R_now, C_now, Val_now)),
    move(R, C),
    R_next is R_now + R,
    C_next is C_now + C,
    Val_next is Val_now + 1,
    iterate(R_next, C_next, Val_next).

iterate(R_now, C_now, Val_now) :-
    remove(Val_now),
    valid(R_now, C_now),
    grid(R_now, C_now),
    \+ memo(R_now, C_now, _),
    \+ ans(R_now, C_now, _),
    assert(memo(R_now, C_now, Val_now)),
    move(R, C),
    R_next is R_now + R,
    C_next is C_now + C,
    Val_next is Val_now + 1,
    iterate(R_next, C_next, Val_next), !.

ans(1, 1, 38).
ans(1, 3, 40).
ans(1, 5, 6).
ans(2, 2, 39).
ans(2, 4, 7).
ans(3, 3, 11).
ans(4, 2, 1).
ans(4, 4, 9).
ans(5, 6, 17).
ans(6, 3, 31).
ans(6, 4, 27).
ans(7, 5, 25).
ans(7, 6, 23).
ans(7, 7, 22).
ans(8, 8, 21).

find_ans :-
    ans(R, C, 1),
    iterate(R, C, 1), !.

clear :-
    retractall(memo(_, _, _)),
    retractall(ans(_, _, _)).