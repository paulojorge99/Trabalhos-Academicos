%Predicados auxiliares


%extensao do predicado soluções: Elemento, Lista, Lista_com_ocorrências -> {V,F}
solucoes(X,Y,L) :- findall(X,Y,L).


%extensao do predicado pertence: Elemento, Lista -> {V,F}
pertence(X,[X|L]).
pertence(X,[Y|L]) :- pertence(X,L).


nao(Questao) :- Questao, !, fail.
nao(Questao). 


%extensão do predicado comprimento: Lista, Resultado ->{V,F}
comprimento([],0).
comprimento([X],1).
comprimento((X|L),R) :- comprimento(L,R1), R is R1+1.



%extensão do predicado apagarelemento: Elemento, lista, lista_sem_elemento ->{V,F}
apagarelemento(X,[],[]).
apagarelemento(X,[X|Y],L):-apagarelemento(X,Y,L).
apagarelemento(X,[H|T],[H|R]) :- X\==H, apagarelemento(X,T,R).



%extensão do predicado apagarrepetidos: lista, lista_sem_elemento ->{V,F}
apagarrepetidos([],[]).
apagarrepetidos([H|T],[H|Y]) :- apagarelemento(H,T,NL),apagarrepetidos(NL,Y).




%extensão do predicado soma: Lista, resultado ->{V,F}
soma([X],X).
soma([N|L],R) :- soma(L,R1), R is N+R1.



%extensão do predicado atender: Nomeutente, Nomeprestador, especialidade, Instituição ->{V,F}
atender(U,P,E,I) -> utente(U,Nome,Idade,Pai,Mãe,NIF,Doenca), 
					  prestador(P,Nomep,E,I).




%extensão do predicado pai: Filho,pai ->{V,F}
pai(F,P) -> utente(Idutente,F,Idade,Cidade,P,Mae,NIF,Doenca).





%extensão do predicado mãe: Filho,mãe ->{V,F}
mae(F,M) -> utente(Idutente,F,Idade,Cidade,Pai,M,NIF,Doenca).