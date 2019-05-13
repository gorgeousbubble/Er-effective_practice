%% @author 10295
%% @doc @todo Add description to area_server0.


-module(area_server0).

%% ====================================================================
%% API functions
%% ====================================================================
-export([loop/0 ]).
-export([auto_test/0]).


%% ====================================================================
%% Internal functions
%% ====================================================================

%% loop function
loop()	->
	receive
		{rectangle, Width, Height}	->
			io:format("Area of rectangle is ~p~n", [Width * Height]);
		{square, Side}				->
			io:format("Area of square is ~p~n", [Side * Side]);
		{circle, Radius}			->
			io:format("Area of circle is ~p~n", [3.1415926 * Radius * Radius]);
		{triangle, Length, Height}	->
			io:format("Area of triangle is ~p~n", [0.5 * Length * Height]);
		_							->
			error
	end.

%% auto_test function
auto_test()	->
	Pid = spawn(fun() -> loop() end),
	Pid ! {rectangle, 5, 4}.