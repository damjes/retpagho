% UZU SWI-PROLOG >= 7
% swipl -s retpagho [-t celo]

:- ['datumbazo/konsili.pl'].

rulu :-
	writeln('Retpaĝo rulas').

kompilu :-
	write('Kompili programon...'),
	qsave_program(retpagho, [
		goal(rulu),
		stand_alone(true)]),
	writeln(' OK!').

disponigu :-
	restauru_db.
