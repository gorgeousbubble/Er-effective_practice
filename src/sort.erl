%% @author 10295
%% @doc @todo Add description to sort.


-module(sort).

%% ====================================================================
%% API functions
%% ====================================================================
-export([bubble_sort/1]).
-export([quick_sort/1]).
-export([insert_sort/1]).

%% ====================================================================
%% Internal functions
%% ====================================================================

%% bubble sort
bubble_sort(L)	when is_list(L), length(L) > 0	->
	bubble_sort(L, length(L)).

bubble_sort(L, 1)	->
	L;
bubble_sort([H|T], N)	->
	L = bubble_sort_once(H, T),
	bubble_sort(L, N-1).

bubble_sort_once(X, [])	->
	[X];
bubble_sort_once(X, [H|T])	->
	if
		X > H	->
			[H|bubble_sort_once(X, T)];
		true	->
			[X|bubble_sort_once(H, T)]
	end.

%% select sort
	
%% quick sort
quick_sort([])	->
	[];
quick_sort([H|T])	->
	quick_sort([X||X<-T, X=<H]) ++ [H] ++ quick_sort([X||X<-T, X>H]).

%% insert sort
insert_sort(L)	->
	insert_sort([], L).

insert_sort(L, [])	->
	L;
insert_sort(L, [H|T])	->
	insert_sort(insert_sort_once(H, L), T).

insert_sort_once(X, [])	->
	[X];
insert_sort_once(X, [H|T])	->
	if
		X > H	->
			[H|insert_sort_once(X, T)];
		true	->
			[X|[H|T]]
	end.
