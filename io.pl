% 1.a
misteri1 :-
    write("Input number or stop (end with .): "),
    read(X), process(X).

process(stop) :- !.

process(N) :-
    Result is N * N * N,
    write("The cube of "), write(N),
    write(" is "), write(Result),
    nl, misteri1.

% 1.b
misteri2([]).

misteri2([L|Ls]) :-
    doline(L), nl,
    misteri2(Ls).

doline([]).

doline([X|L]) :-
    write(X), tab(1), doline(L).

% 1.c
misteri3 :-
    get0(C), put(C), dorest(C).

dorest(46) :- !.

dorest(32) :-
    !, get(C),
    put(C), dorest(C).

dorest(_) :-
    misteri3.