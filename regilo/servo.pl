:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).

servo(Pordo) :-
	http_server(http_dispatch, [port(Pordo)]).

servo :-
	agordoj(Agordoj),
	servo(Agordoj.pordo).

:- http_handler(root(peto), peto, [prefix]).

