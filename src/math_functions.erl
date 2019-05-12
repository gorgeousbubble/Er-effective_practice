%% @author 10295
%% @doc @todo Add description to math_functions.


-module(math_functions).

%% ====================================================================
%% API functions
%% ====================================================================
-export([even/1, odd/1]).
-export([auto_test/0]).


%% ====================================================================
%% Internal functions
%% ====================================================================

%% even function
even(X) when is_integer(X)	->
	case X rem 2 of
		0	-> true;
		1	-> false
	end.

%% odd function
odd(X) when is_integer(X)	->
	case X rem 2 of
		0	-> false;
		1	-> true
	end.

%% auto_test function
auto_test()	->
	io:format("When X=2, function execution result:~n even(X):~p~n odd(X):~p~n", [even(2), odd(2)]),
	io:format("When X=5, function execution result:~n even(X):~p~n odd(X):~p~n", [even(5), odd(5)]).