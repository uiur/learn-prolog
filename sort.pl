partition([], _, [], []).
partition([Head|Tail], Value, Upper, Lower) :- Head >= Value, partition(Tail, Value, TailUpper, Lower), append(TailUpper, [Head], Upper).
partition([Head|Tail], Value, Upper, Lower) :- Head < Value, partition(Tail, Value, Upper, TailLower), append(TailLower, [Head], Lower).

% sort_list([1,5,4,3,2], W).
sort_list([], []).
sort_list([Head|Tail], Sorted) :- partition(Tail, Head, Upper, Lower), sort_list(Lower, SortedLower), sort_list(Upper, SortedUpper), append(SortedLower, [Head|SortedUpper], Sorted).
