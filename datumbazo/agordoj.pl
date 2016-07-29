prenu_uzantan_chenon(Ag, '') :-
	Ag.uzanto = "".

kreu_URLon(URLo) :-
	agordoj(Agordoj),
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
	foldl(string_concat, Cheno, '/', URLo).

rekreu_URLon :-
	retractall(db_urlo(_)),
	kreu_URLon(U), !,
	assertz(db_urlo(U)).

