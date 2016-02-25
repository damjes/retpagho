% UZU SWI-PROLOG >= 7
% swipl -s disponigilo [-t celo]

legu_agordoj(Agordoj) :-
	[library(http/json)],
	setup_call_cleanup(
		open('agordoj.json', read, Fluo),
		json_read_dict(Fluo, Agordoj),
		close(Fluo)).

laboru_kun_db(Reghimo, Agordoj) :-
	foldl(string_concat,
		[
			
