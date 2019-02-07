sum(S, L) :- 
	L = [H|T],
	sum(S2, T),
	S is H + S2.
sum(0, []).

isPrime(X) :- X < 2, !, false.
isPrime(X) :- X = 2, true.
isPrime(X) :- isPrime(X, round(sqrt(X))).

isPrime(A, B) :-
	(
		B < 2 -> true
		;
		(
			0 is A mod B -> false
			;
			B1 is B - 1,
			isPrime(A, B1)
		)
	).

primes(A, B, L) :-
	primes(A, B, [], L).

primes(A, B, L, LF) :-
	(
		A > B -> 
		LF = L
		;
		B1 is B-1,
		(
		isPrime(B) ->
		primes(A, B1, [B | L], LF)
		;
		primes(A, B1, L, LF)
		)
	).

prime_partition(N) :-
	primes(1, N, P),
	prime_partition(N, P, [], L),
	sort(L, SL),
	print_list(SL).

prime_partition(N, P, L, LF) :-
	(
		sum(S, L),
		S = N -> 
		LF = L
		;
		P = [H|T],
		(
		prime_partition(N, T, [H|L], LF) ;
		prime_partition(N, T, L, LF)
		)
	).

print_list(L) :-
	L = [H|T],
	length(T, LEN),
	(
		LEN = 0 -> 
		format('~d', H)
		;
		format('~d + ', H)
	),
	print_list(T).

print_list([]).