%% @author 10295
%% @doc @todo Add description to misc.


-module(misc).

%% ====================================================================
%% API functions
%% ====================================================================
-export([for/3]).
-export([my_tuple_to_list/1]).


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