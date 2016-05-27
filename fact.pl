fact(0, 1).
fact(N, Result) :- N > 0, N1 is N - 1, fact(N1, F1), Result is N * F1.
