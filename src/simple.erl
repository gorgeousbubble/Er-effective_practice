%% @author 10295
%% @doc @todo Add description to simple.


-module(simple).

%% ====================================================================
%% API functions
%% ====================================================================
-export([auto_test/0]).
-export([sum/1]).
-export([sum2/1]).
-export([maximal/1]).
-export([split/1]).

%% ====================================================================
%% Internal functions
%% ====================================================================

%% auto_test function
auto_test() ->
	true 	=	(a == a),
	4		=	(19 rem 5),
	true	=	('zzz' == zzz),
	false	=	'Erlang Programing' == "Erlang Programing",
	false	=	'1+2+3' == 6,
	true	=	[$E,$r,$i,$c,$s,$s,$o,$n,$ ,$S,$h,$a,$n,$g,$H,$a,$i] == "Ericsson ShangHai",
	3		=	length([a,[b,[c,d,e],f],[g,h]]),
	false	=	["Hello", "World"] == "Hello World",
	false	=	[x|[y,z]] == [x|[y|z]],
	false	=	[[1,2]|3] == [1,2,3],
	[a,[b,c],d,e,[fg]] = [a,[b,c],d]++[e,[fg]],
	[a,[b,c]]	=	[a,[b,c],d] -- [b,d],
	[A|B] = [a,b],
	[b] = B,
	3 = tuple_size({abc,{def,123},ghi}),
	Person = {person, "Mike", "Williams", [1,2,3,4]},
	{person, Name, Surname, Phone} = Person,
	"Mike" = Name,
	success.
	
%% sum function
sum(L)	->
	lists:foldl(fun(X, S) -> S + X end, 0, L).

%% sum2 function
sum2([])	->
	0;
sum2([H|T])	->
	H + sum2(T).

%% maximal function
maximal([])	->
	list_is_empty;
maximal([H|T])	->
	maximal(H, T).

maximal(X, [])	->
	X;
maximal(X, [H|T])	->
	if
		H > X	->
			maximal(H, T);
		true	->
			maximal(X, T)
	end.

%% split function
split(L)	->
	L1 = [X||X<-L, X rem 2 == 0],
	L2 = [X||X<-L, X rem 2 == 1],
	io:format("odd list:~p~n", [L1]),
	io:format("even list:~p~n", [L2]).
			