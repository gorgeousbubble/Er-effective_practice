%% @author 10295
%% @doc @todo Add description to stimer.


-module(stimer).

%% ====================================================================
%% API functions
%% ====================================================================
-export([start/2]).
-export([cancel/0]).
-export([timer/2]).
-export([auto_test/0]).

%% ====================================================================
%% Internal functions
%% ====================================================================

%% start function
start(F, T)	->
	register(?MODULE, spawn(fun() -> timer(F, T) end)).

%% cancel function
cancel()	->
	?MODULE ! {self(), cancel}.

%% timer function
timer(F, T)	->
	receive
		{_From, cancel}	->
			void
	after T	->
		F(),
		timer(F, T)
	end.

%% auto_test function
auto_test()	->
	start(fun() -> io:format("time is up!~n") end, 5000).
