%% @author 10295
%% @doc @todo Add description to misc.


-module(misc).

%% ====================================================================
%% API functions
%% ====================================================================
-export([for/3]).
-export([my_tuple_to_list/1]).
-export([sleep/1]).
-export([flush_buffer/0]).

%% ====================================================================
%% Internal functions
%% ====================================================================

%% for function
for(Max, Max, F)	->
	[F(Max)];
for(I, Max, F)		->
	[F(I)|for(I+1, Max, F)].

%% my_tuple_to_list function
my_tuple_to_list(T)	->
	Count = tuple_size(T),
	for(1, Count, fun(I) -> element(I, T) end).

%% sleep function
sleep(T)	->
	receive
		after T	->
			true
	end.

%% flush_buffer function
flush_buffer()	->
	receive
		_Any	->
			flush_buffer()
	after 0		->
		true
	end.