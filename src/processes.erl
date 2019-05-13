%% @author 10295
%% @doc @todo Add description to processes.


-module(processes).

%% ====================================================================
%% API functions
%% ====================================================================
-export([max/1]).



%% ====================================================================
%% Internal functions
%% ====================================================================

%% max function
max(N)	->
	Max = erlang:system_info(process_limit),
	io:format("Maximum allowed processes:~p~n", [Max]),
	statistics(runtime),
	statistics(wall_clock),
	L = for(1, N, fun() -> spawn(fun() -> wait() end) end),
	{_, Time1} = statistics(runtime),
	{_, Time2} = statistics(wall_clock),
	U1 = Time1 * 1000 / N,
	U2 = Time2 * 1000 / N,
	io:format("Process spawn time=~p (~p) microseconds~n", [U1, U2]).

%% wait function
wait()	->
	receive
		die	->
			void
	end.

%% for function
for(Max, Max, F)	->
	[F(Max)];
for(I, Max, F)		->
	[F(I)|for(I+1, Max, F)].
