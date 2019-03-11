% 1

num(o).
num(f(X)) :- num(X).

ganjil(f(o)).
ganjil(f(f(X))) :- ganjil(X).

kurang_dr(o, f(o)).
kurang_dr(o, f(X)) :- kurang_dr(o, X).
kurang_dr(f(X), f(Y)) :- kurang_dr(X, Y).

% 2

kata(astante, a, s, t, a, n, t, e).
kata(astoria, a, s, t, o, r, i, a).
kata(baratto, b, a, r, a, t, t, o).
kata(cobalto, c, o, b, a, l, t, o).
kata(pistola, p, i, s, t, o, l, a).
kata(statale, s, t, a, t, a, l, e).

% kalau tidak boleh sama
beda(_, []).
beda(X, [H|T]) :- X \= H, beda(X, T).

cek_beda([]).
cek_beda([H|T]) :- beda(H, T), cek_beda(T).

cek22(X, Y) :- kata(X, _, A, _, _, _, _, _), kata(Y, _, A, _, _, _, _, _).
cek24(X, Y) :- kata(X, _, A, _, _, _, _, _), kata(Y, _, _, _, A, _, _, _).
cek26(X, Y) :- kata(X, _, A, _, _, _, _, _), kata(Y, _, _, _, _, _, A, _).
cek44(X, Y) :- kata(X, _, _, _, A, _, _, _), kata(Y, _, _, _, A, _, _, _).
cek46(X, Y) :- kata(X, _, _, _, A, _, _, _), kata(Y, _, _, _, _, _, A, _).
cek66(X, Y) :- kata(X, _, _, _, _, _, A, _), kata(Y, _, _, _, _, _, A, _).

tts(V1, V2, V3, H1, H2, H3) :- cek22(V1, H1), cek24(H2, V1), cek26(H3, V1),
	cek24(V2, H1), cek44(V2, H2), cek46(H3, V2),
	cek26(V3, H1), cek46(V3, H2), cek66(H3, V3),
	cek_beda([V1, V2, V3, H1, H2, H3]).

% 3

%% a. false
%% b. true
%% c. false
%% d. true
%% e. false
%% f. true
%% g. false
%% h. true
%% i. true
%% j. false
%% k. false

% 4

rev([], A, A).
rev([H|T], A, R) :- rev(T, [H|A], R).

kebalikan(X, Y) :- rev(X, [], Y).

% 5 (a)

terakhir(X, L) :- rev(X, [], [L|_]).

% 5 (b)

last([X], X).
last([_|T], X) :- last(T, X).

% 6

palindrome(X) :- kebalikan(X, X).

% 7 (a)

lshift([H|T], L) :- append(T, [H], L).

% 7 (b)

rshift(X, L) :- kebalikan(X, A), lshift(A, B), kebalikan(B, L).

% 8

fduplikat([], L, L).
fduplikat([H|T], A, L) :- append([H, H], A, X), fduplikat(T, X, L).

duplikat(X, L) :- fduplikat(X, [], R), kebalikan(R, L).

% 9

remove(_, [], O, O).
remove(A, [H|T], X, O) :- A = H, remove(A, T, X, O).
remove(A, [H|T], X, O) :- A \= H, remove(A, T, [H|X], O).

hapus([], R, R).
hapus([A|B], X, R) :- remove(A, X, [], O), kebalikan(O, P), hapus(B, P, R).