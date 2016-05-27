min([Head], Head).
min([Head|Tail], Min) :- min(Tail, TailMin), Head >= TailMin, Min is TailMin.
min([Head|Tail], Min) :- min(Tail, TailMin), Head < TailMin, Min is Head.
