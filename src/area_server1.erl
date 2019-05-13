%% @author 10295
%% @doc @todo Add description to area_server1.


-module(area_server1).

%% ====================================================================
%% API functions
%% ====================================================================
-export([start/0, rpc/1, loop/0, auto_test/0]).



%% ====================================================================
%% Internal functions
%% ====================================================================

%% start function
start()	->
	register(?MODULE, spawn(fun() -> loop() end)).

%% rpc function
rpc(Request)	->
	?MODULE ! {self(), Request},
	receive
		{_From, Response}	->
			Response
	end.

%% loop function
loop()	->
	receive
		{From, Request}	->
			case Request of
				{rectangle, Width, Height}	->
					From ! {self(), Width * Height},
					loop();
				{square, Side}				->
					From ! {self(), Side * Side},
					loop();
				{circle, Radius}			->
					From ! {self(), 3.1415926 * Radius * Radius},
					loop();
				{triangle, Length, Height}	->
					From ! {self(), 0.5 * Length * Height},
					loop();
				_							->
					From ! {self(), error},
					loop()
			end
	end.

%% auto_test function
auto_test()	->
	start(),
	rpc({triangle, 3, 4}).