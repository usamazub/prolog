directTrain(saarbruecken,dudweiler). 
directTrain(forbach,saarbruecken). 
directTrain(freyming,forbach). 
directTrain(stAvold,freyming). 
directTrain(fahlquemont,stAvold). 
directTrain(metz,fahlquemont). 
directTrain(nancy,metz).

connected(A, B) :- directTrain(A, B).
connected(A, B) :- directTrain(B, A).

travelFromTo(X, Y, List) :- connected(X, Y), \+ member(Y, List), !.
travelFromTo(X, Y, List) :-
    connected(X, Z),
    \+ member(Z, List),
    travelFromTo(Z, Y, [Z|List]).

travelFromTo(X, Y) :- travelFromTo(X, Y, [X]).

route(X, Y, Route, List) :- 
    connected(X, Y), \+ member(Y, List), !, reverse([Y|List], Route).
route(X, Y, Route, List) :-
    connected(X, Z), \+ member(Z, List), route(Z, Y, Route, [Z|List]).

route(X, Y, Route) :- route(X, Y, Route, [X]).

reverse([], Ans, Ans).
reverse([A|As], List, Ans) :- reverse(As, [A|List], Ans).

reverse(X, Y) :- reverse(X, [], Y).