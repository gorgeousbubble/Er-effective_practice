%% @author 10295
%% @doc @todo Add description to geometry.


-module(geometry).

%% ====================================================================
%% API functions
%% ====================================================================
-export([area/1, area2/1]).



%% ====================================================================
%% Internal functions
%% ====================================================================

%% area function
area({rectangle, Width, Height})	->
	Width * Height;
area({square, Side})				->
	Side * Side;
area({circle, Radius})				->
	3.1415926 * Radius * Radius;
area({triangle, Length, Height})	->
	Length * Height div 2.

% area2 function
area2(T)	->
	case T of
		{rectangle, Width, Height}	->
			Width * Height;
		{square, Side}				->
			Side * Side;
		{circle, Radius}			->
			3.1415926 * Radius * Radius;
		{triangle, Length, Height}	->
			Length * Height div 2;
		_							->
			undefined
	end.