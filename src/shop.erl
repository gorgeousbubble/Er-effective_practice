%% @author 10295
%% @doc @todo Add description to shop.


-module(shop).

%% ====================================================================
%% API functions
%% ====================================================================
-export([cost/1]).
-export([total/1]).
-export([auto_test/0]).


%% ====================================================================
%% Internal functions
%% ====================================================================

%% cost function
cost(oranges)	->	5;
cost(newspaper)	->	8;
cost(apples)	->	2;
cost(pears)		->	9;
cost(milk)		->	7.

%% total function
total([])	->
	0;
total([{Class, Number}|T])	->
	Number * cost(Class) + total(T).

%% auto_test function
auto_test()	->
	Buy = [{oranges, 4}, {newspaper, 1}, {apples, 10}, {pears, 6}, {milk, 3}],
	total(Buy).