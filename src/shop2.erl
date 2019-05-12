%% @author 10295
%% @doc @todo Add description to shop2.


-module(shop2).

%% ====================================================================
%% API functions
%% ====================================================================
-export([total/1]).
-export([auto_test/0]).
-export([auto_test2/0]).
-import(shop, [cost/1]).
-import(lists, [map/2, sum/1]).

%% ====================================================================
%% Internal functions
%% ====================================================================

%% total function
total(L)	->
	lists:sum(lists:map(fun({Class, Number}) -> Number * shop:cost(Class) end, L)).

%% auto_test function
auto_test()	->
	Buy = [{oranges, 4}, {newspaper, 1}, {apples, 10}, {pears, 6}, {milk, 3}],
	total(Buy).

auto_test2()	->
	Buy = [{oranges, 4}, {newspaper, 1}, {apples, 10}, {pears, 6}, {milk, 3}],
	lists:sum([shop:cost(A) * B || {A, B} <- Buy]).