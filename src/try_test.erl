%% @author 10295
%% @doc @todo Add description to try_test.


-module(try_test).

%% ====================================================================
%% API functions
%% ====================================================================
-export([demo1/0]).
-export([demo2/0]).


%% ====================================================================
%% Internal functions
%% ====================================================================

%% generate_exception function
generate_exception(1)	->	a;
generate_exception(2)	->	throw(a);
generate_exception(3)	->	exit(a);
generate_exception(4)	->	{'EXIT', a};
generate_exception(5)	->	error(a).

%% catcher function
catcher(N)	->
	try generate_exception(N) of
		Val	-> {N, normal, Val}
	catch
		throw: 	X	-> {N, caught, thrown, X};
		exit:	X	-> {N, caught, exited, X};
		error:	X	-> {N, caught, error,  X}
	end.

%% demo1 function
demo1()	->
	[catcher(I)||I<-[1,2,3,4,5]].

%% demo2 function
demo2()	->
	[{I, (catch generate_exception(I))}||I<-[1,2,3,4,5]].