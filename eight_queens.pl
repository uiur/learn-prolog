valid_queen((_, Col)) :-
  Range = [1,2,3,4,5,6,7,8],
  member(Col, Range).

valid_board([]).
valid_board([Head|Tail]) :- valid_queen(Head), valid_board(Tail).

columns([], []).
columns([(_, Col)|Tail], [Col|TailCols]) :- columns(Tail, TailCols).

diags1([], []).
diags1([(Row, Col)|Tail], [Diag|DiagsTail]) :-
  Diag is Col - Row,
  diags1(Tail, DiagsTail).

diags2([], []).
diags2([(Row, Col)|Tail], [Diag|DiagsTail]) :-
  Diag is Col + Row,
  diags2(Tail, DiagsTail).

board([], []).
board([Head|Tail], [(N, Head)|BoardTail]) :-
  length(Tail, TailLength),
  N is 8 - TailLength,
  board(Tail, BoardTail).

eight_queens(Queens) :-
  length(Queens, 8),
  board(Queens, Board),
  valid_board(Board),

  columns(Board, Cols),
  diags1(Board, Diags1),
  diags2(Board, Diags2),

  fd_all_different(Cols),
  fd_all_different(Diags1),
  fd_all_different(Diags2).
