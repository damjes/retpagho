:- use_module(library(http/http_open)).
:- use_module(library(http/http_header)).

demandu_datumbazon(Vojo, Metodo, Agordoj, JSON) :-
	db_urlo(URLo),
	string_concat(URLo, Vojo, U),
	setup_call_cleanup(
		http_open(U, Torento, [method(Metodo) | Agordoj]),
		json_read_dict(Torento, JSON, []),
		close(Torento)).
