peto(Peto) :-
        format('Content-type: text/html~n~n', []),
        format('<html>~n', []),
        format('<table border=1>~n'),
        presu_peton(Peto),
        format('~n</table>~n'),
        format('</html>~n', []).

presu_peton([]).
presu_peton([H|T]) :-
        H =.. [Nomo, Valoro],
        format('<tr><td>~w<td>~w~n', [Nomo, Valoro]),
        presu_peton(T).
