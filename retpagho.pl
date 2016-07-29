:- encoding(utf8).

% UZU SWI-PROLOG >= 7
% swipl -s retpagho [-t celo]

:- ['datumbazo/konsili.pl'].

rulu :-
	writeln('Retpaĝo rulas').

kompilu :-
	write('Kompili programon...'),
	set_prolog_flag(optimise, true),
	qsave_program(retpagho, [
		foreign(save),
		goal(rulu),
		stand_alone(true)]),
	writeln(' OK!').

disponigu :-
	restauru_db.

% eta helpo kun inotify
ricevu_signalon(usr1) :- make.
:- on_signal(usr1, _, ricevu_signalon).

