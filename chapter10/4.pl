directTrain(saarbruecken,dudweiler). 
directTrain(forbach,saarbruecken). 
directTrain(freyming,forbach). 
directTrain(stAvold,freyming). 
directTrain(fahlquemont,stAvold). 
directTrain(metz,fahlquemont). 
directTrain(nancy,metz).

connected(A, B) :- directTrain(A, B).
connected(A, B) :- directTrain(B, A).

travelFromTo(S, D) :- travelFromTo(S, D, []).

travelFromTo(S, D, _) :- connected(S, D), !.
travelFromTo(S, D, L) :-
    connected(S, X),
    \+member(S, L),
    travelFromTo(X, D, [S|L]).

route(S, D, Route) :- route(S, D, Route, []).

route(S, D, [S, D], _) :- connected(S, D), !.
route(S, D, [S|Ss], L) :-
    connected(S, X),
    \+member(S, L),
    route(X, D, Ss, [S|L]).