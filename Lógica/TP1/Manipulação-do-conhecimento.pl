%Manipulação do conhecimento


%extensão do predicado que identifica as instituições prestadoras de serviços: Instituição,Resultado ->{V,F}
idtinstituicoes(X) :- solucoes(I, servico(A,P,D,I,C),L),apagarrepetidos(L,R), pertence(X,R).


%extensao do predicado que mostra todas as instituições prestadoras de serviços: servico,Resultado ->{V,F}
idtinstituicoes2(S,R) :- solucoes(H,servico(A,B,S,H,C),Y),apagarrepetidos(Y,R).



%extensão do predicado que identifica utentes por critérios de seleção: idade, resultado ->{V,F}
idtutente(I,R) :- solucoes(U,utente(A,U,I,C,P,M,N,D),R).


%extensao do predicado que identifica utentes por criterios de selecao: cidade,resultado ->{V,F}
idtutente2(C,R) :- solucoes(U,utente(A,U,I,C,P,M,N,D),R).


%extensao do predicado que identifica utentes por criterios de selecao: doenca,resultado ->{V,F}
idtutente3(D,R) :- solucoes(U,utente(A,U,I,C,P,M,N,D),R).



%extensao do predicado que identifica serviços por criterios de selecao: idprestador, resultado ->{V,F}
idtservico(X,R) :- solucoes(D,servico(A,X,D,I,C),R).



%extensao do predicado que identifica serviços por criterios de selecao: Instituição, resultado ->{V,F}
idtservico2(X,R) :- solucoes(D,servico(A,P,D,X,C),R).


%extensao do predicado que identifica serviços por criterios de selecao: cidade, resultado ->{V,F}
idtservico3(X,R) :- solucoes(D,servico(A,P,D,I,X),R).



%extensao do predicado que identifica consultas por criterios de selecao: data,resultado ->{V,F}
idtconsulta(X,R):-solucoes(A,consulta(A,X,U,S,P,C),R).


%extensao do predicado que identifica consultas por criterios de selecao: utente,resultado ->{V,F}
idtconsulta2(X,R):-solucoes(A,consulta(A,D,X,S,P,C),R).



%extensao do predicado que identifica consultas por criterios de selecao: serviço,resultado ->{V,F}
idtconsulta3(X,R):-solucoes(A,consulta(A,D,U,X,P,C),R).



%extensao do predicado que identifica consultas por criterios de selecao: prestador,resultado ->{V,F}
idtconsulta4(X,R):-solucoes(A,consulta(A,D,U,S,X,C),R).



%extensao do predicado que identifica consultas por criterios de selecao: custo,resultado ->{V,F}
idtconsulta5(X,R):-solucoes(A,consulta(A,D,U,S,P,X),R).




%extensao do predicado que identifica serviços por data: data,resultado ->{V,F}
idtservico4(X,L) :- solucoes(D,(consulta(A,X,U,S,P,C),servico(S,P,D,T,Z)),R),apagarrepetidos(R,L).


%extensao do predicado que identifica serviços por custo: custo,resultado ->{V,F}
idtservico5(X,L) :- solucoes(D,(consulta(A,E,U,S,P,X),servico(S,P,D,T,Z)),R),apagarrepetidos(R,L).




%extensao do predicado que identifica utentes de um serviço: serviço, resultado ->{V,F}
idtutente4(X,L) :- solucoes(N,(consulta(A,B,U,S,P,C),servico(S,P,X,T,Z),utente(U,N,I,V,W,Y,G,H)),R),apagarrepetidos(R,L).



%extensao do predicado que identifica utentes de uma instituição: instituição, resultado ->{V,F}
idtutente5(X,L) :- solucoes(N,(servico(A,P,D,X,C),consulta(F,T,U,A,P,Y),utente(U,N,I,V,W,K,G,H)),R),apagarrepetidos(R,L).



%extensão do predicado que identifica serviços realizados por utente: utente, resultado ->{V,F}
idtservico6(X,L) :- solucoes(D,(servico(S,P,D,I,C),consulta(A,J,X,S,P,Y)),R),apagarrepetidos(R,L).



%extensão do predicado que identifica serviços realizados por instituição: instituição, resultado ->{V,F}
idtservico7(X,L) :- solucoes(D,(servico(S,P,D,X,C),consulta(A,J,U,S,P,Y)),R),apagarrepetidos(R,L).



%extensão do predicado que identifica serviços realizados por cidade: cidade, resultado ->{V,F}
idtservico8(X,R) :- solucoes(D,(servico(S,P,D,I,X),consulta(A,J,U,S,P,C)),R).



%extensão do predicado que identifica o custo total dos cuidados de saúde por utente: utente, valor ->{V,F}
idtcusto(N,V) :- solucoes(C,(consulta(A,D,U,S,P,C),utente(U,N,Y,V,W,Z,T,E)),L), soma(L,V).


%extensão do predicado que identifica o custo total dos cuidados de saúde por serviço: serviço, valor ->{V,F}
idtcusto2(S,V) :- solucoes(C,consulta(A,D,U,S,P,C),L), soma(L,V).


%extensão do predicado que identifica o custo total dos cuidados de saúde por instituição: instituição, valor ->{V,F}
idtcusto3(I,V) :- solucoes(C,(servico(S,P,H,I,T),consulta(A,D,U,S,P,C)),L), soma(L,V).



%extensão do predicado que identifica o custo total dos cuidados de saúde por data: data, valor ->{V,F}
idtcusto4(D,V) :- solucoes(C,consulta(A,D,U,S,P,C),L), soma(L,V).



%extensão do predicado que identifica o custo total dos cuidados de saúde por prestador: prestador, valor ->{V,F}
idtcusto5(P,V) :- solucoes(C,consulta(A,D,U,S,P,C),L), soma(L,V).





%extensão do predicado que permite a evolução do conhecimento: Termo ->{V,F}

evolucao(Termo) :- solucoes(Inv, +Termo::Inv, Linv), 
					inserir(Termo),
					teste(Linv).

%extensão do predicado que permite a inserção do termo: Termo ->{V,F}

inserir(Termo) :- assert(Termo).
inserir(Termo) :- retract(Termo), !, fail.


%extensão do predicado que permite testar os invariantes de uma lista: Termo ->{V,F}

teste([]).
teste([I|R]) :- I,teste(R).




%extensão do predicado que permite a involução do conhecimento: Termo ->{V,F}

involucao(Termo) :- solucoes(Inv, -Termo::Inv, Linv), testar(Linv), remover(Termo).


%extensão do predicado que permite a remoção do termo: Termo ->{V,F}

remover(Termo) :- retract(Termo).
remover(Termo) :- assert(Termo), !, fail.


%extensão do predicado que permite testar os invariantes de uma lista: Termo ->{V,F}

testar([]).
testar([I|R]) :- I,testar(R).

