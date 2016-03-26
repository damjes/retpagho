:- [http_fasado].

priparu_dok(Enigo, Eligo) :-
	del_dict('_rev', Enigo.doc, _, Eligo).

priparu_savkopion(Enigo, _{docs: Eligo}) :-
	maplist(priparu_dok, Enigo.rows, Eligo).

savu_db(Dosiernomo) :-
	demandu_datumbazon("_all_docs?include_docs=true", get, [], Kruda),
	priparu_savkopion(Kruda, Priparita),
	setup_call_cleanup(
		open(Dosiernomo, write, Torento, []),
		(
			json_write_dict(Torento, Priparita, [width(1)]),
			nl(Torento)),
		close(Torento)).

savu_db :-
	savu_db('datumbazo.json').

restauru_db(Dosiernomo) :-
	writeln('Forigi malnovan datumbazon...'),
	% tio povas fari eraron 404
	demandu_datumbazon("", delete, [status_code(_)], _),
	writeln('Krei novan datumbazon...'),
	demandu_datumbazon("", put, [status_code(201)], _),
	writeln('Enmeti dokumentojn en datumbazo...'),
	demandu_datumbazon("_bulk_docs", post, [
		post(
			file(
				"application/json",
				Dosiernomo)),
		status_code(201)], _),
	writeln('Datumbazo restaŭrita').
