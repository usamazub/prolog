

subset([], _, A) :-
    sort(A, A).
    
subset([H|T], B, L) :-
    member(H, B),
    \+ member(H, L),
    subset(T, B, [H|L]).
    
subset(A, B) :-
    subset(A, B, []), retractall(memo/1).