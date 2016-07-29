:- [library(http/json)].

legu_agordojn(Agordoj) :-
	setup_call_cleanup(
		open('agordoj.json', read, Fluo),
		json_read_dict(Fluo, Agordoj),
		close(Fluo)).

aldonu_agordojn :-
	legu_agordojn(Agordoj),
	asserta(agordoj(Agordoj)).

:- aldonu_agordojn.
