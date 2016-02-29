:- [library(http/json)].

legu_agordoj(Agordoj) :-
	setup_call_cleanup(
		open('agordoj.json', read, Fluo),
		json_read_dict(Fluo, Agordoj),
		close(Fluo)).

prenu_uzantan_chenon(Ag, '') :-
	Ag.uzanto = "".

kreu_URLon(URLo) :-
	legu_agordoj(Agordoj),
	Ag = Agordoj.datumbazo,
	prenu_uzantan_chenon(Ag, Uz),
	reverse(Cheno, [
		Ag.protokolo,
		"://",
		Uz,
		Ag.gastiganto,
		":",
		Ag.pordo,
		Ag.vojo,
		"/",
		Ag.datumbazo]),
	foldl(string_concat, Cheno, '', URLo).
