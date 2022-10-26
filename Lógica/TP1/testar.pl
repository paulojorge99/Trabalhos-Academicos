#Este ficheiro é usado para testar a base de conhecimento no interpretador de Prolog, sendo que o código aqui presente é uma junção
#do código de todos os outros ficheiros


:- set_prolog_flag( unknown,fail ).
:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- op(900,xfy,'::').
:- dynamic utente/8.
:- dynamic prestador/4.
:- dynamic consulta/6.
:- dynamic servico/5.





%predicado utente: IdUt, Nome, Idade, Cidade, Pai, Mãe, NIF,doenca  -> {V,F}
utente(100,margaridaalves,19,braga,manuelalves,joanaalves,123456789,asma).
utente(101,josepereira,23,porto,henriquepereira,anapereira,456789123,bronquite).
utente(102,luisdelgado,33,famalicao,luisdelgado,dianadelgado,345678912,covid).
utente(103,rodrigomendes,25,barcelos,josemendes,luisamendes,789123456,covid).
utente(104,claudiasoares,20,famalicao,andresoares,joanasoares,891234567,febre).
utente(105,ruigoncalves,41,braga,sergiogoncalves,inesgoncalves,912345678,diarreia).
utente(106,leonorgarcia,9,guimaraes,diogogarcia,saragarcia,657891234,covid).
utente(107,mariamagalhaes,29,porto,ricardomagalhaes,soniamagalhaes,567891234,bronquite).
utente(108,manuelsilva,23,braga,joaosilva,teresasilva,213456789,pneumonia).
utente(109,fernandocerqueira,12,braga,nunocerqueira,joanacerqueira,765891234,covid).
utente(110,ismaelbarbosa,54,barcelos,jorgebarbosa,patriciabarbosa,987654321,asma).



%predicado servico: Idserv, IdPrest,Descrição, Instituição, Cidade -> {V,F}
servico(200,1005,oscultar,hospitaldatrofa,trofa).
servico(201,1003,medirtensao,hospitaldatrofa,trofa).
servico(202,1010,analises,hospitalsantaluzia,vianadocastelo).
servico(203,1004,medirfebre,hospitalpublicodebraga,braga).
servico(204,1006,analisessecrecoes,hospitalprivadodebraga,braga).
servico(205,1002,medirtensao,hospitalpublicodebraga,braga).
servico(206,1001,oscultar,hospitalpublicodebraga,braga).
servico(207,1008,oscultar,hospitalprivadodebraga,braga).
servico(208,1004,analises,hospitalpublicodebraga,braga).



%predicado consulta: IdCons, Data, IdUt, IdServ, Idprest, Custo -> {V,F}
consulta(1,06112020,100,200,1005,80).
consulta(2,10102020,105,204,1006,110).
consulta(3,22122020,110,206,1001,30).
consulta(4,25112020,109,208,1004,25).
consulta(5,30112020,106,203,1004,30).
consulta(6,10102020,109,202,1010,60).
consulta(7,06112020,107,206,1001,30).
consulta(8,25112020,102,203,1004,35).
consulta(9,30112020,110,206,1001,30).
consulta(10,10102020,103,203,1004,40).
consulta(11,06112020,104,203,1004,25).
consulta(12,30112020,109,208,1004,35).




%predicado prestador: IdPrest, Nome, Especialidade, Instituição -> {V,F}
prestador(1000,joaovasquez,medicinageral,hospitalpublicodebraga).
prestador(1001,thomaskall,pneumologista,hospitalpublicodebraga).
prestador(1002,anasilva,medicinageral,hospitalprivadodebraga).
prestador(1003,josecorreia,pediatra,hospitaldatrofa).
prestador(1004,gabrielarodrigues,medicinageral,hospitalpublicodebraga).
prestador(1005,franciscomenezes,pneumologista,hospitaldatrofa).
prestador(1006,franciscaalves,endocrinologia,hospitalprivadodebraga).
prestador(1007,danielnunes,endocrinologia,hospitalsantaluzia).
prestador(1008,henriquelage,pneumologista,hospitalprivadodebraga).
prestador(1009,saralurdes,pediatra,hospitalsantaluzia).
prestador(1010,hugopereira,medicinageral,hospitalsantaluzia).





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





%Predicado Utente
%invariante de Inserção Estrutural: não permite a inserção de um utente se este já existir na base de conhecimento
+utente(A,B,C,D,E,F,G,H) :: (solucoes((A,B,C,D,E,F,G,H),utente(A,B,C,D,E,F,G,H),S), comprimento(S,N), N==1).

%Invariante de Inserção Referencial: não permite a inserção de um utente com o mesmo id
+utente(A,_,_,_,_,_,_,_) :: (solucoes(A,utente(A,_,_,_,_,_,_,_),S), comprimento(S,N), N==1).


%Invariante de Inserção Referencial: não permite a inserção de um utente com o mesmo nif
+utente(_,_,_,_,_,_,N,_) :: (solucoes(N,utente(_,_,_,_,_,_,N,_),S), comprimento(S,R), R==1).


%Invariante de Inserção Referencial: não permite a inserção de um utente com mais de um pai
+utente(A,B,C,D,E,F,G,H) :: (solucoes(Ps,utente(_,B,_,_,Ps,_,_,_),S), comprimento(S,R), R =<1).


%Invariante de Inserção Referencial: não permite a inserção de um utente com mais de uma mãe
+utente(A,B,C,D,E,F,G,H) :: (solucoes(Ms,utente(_,B,_,_,_,Ms,_,_),S), comprimento(S,R), R=<1).


%invariante de Remoção Estrutural: permite a remoção de um utente se este existir na base de conhecimento
-utente(A,B,C,D,E,F,G,H) :: (solucoes((A,B,C,D,E,F,G,H),(utente(A,B,C,D,E,F,G,H)),S), comprimento(S,N), N == 1).


%Invariante de Remoção Referencial: permite a remoção de um utente se não estiver associado a nenhuma consulta
-utente(A,B,C,D,E,F,G,H) :: (solucoes(A,consulta(T,Y,A,V,Z,J),S), comprimento(S,N), N==0).






%Predicado Prestador
%invariante de Inserção Estrutural: não permite a inserção de um prestador se este já existir na base de conhecimento
+prestador(A,B,C,D) :: (solucoes((A,B,C,D),prestador(A,B,C,D),S), comprimento(S,N), N==1).


%Invariante de Inserção Referencial: não permite a inserção de um prestador com o mesmo id
+prestador(A,_,_,_) :: (solucoes(A,prestador(A,_,_,_),S), comprimento(S,N), N==1).


%invariante de Remoção Estrutural: permite a remoção de um prestador se este existir na base de conhecimento
-prestador(A,B,C,D) :: (solucoes((A,B,C,D),prestador(A,B,C,D),S), comprimento(S,N), N==1).

%Invariante de Remoção Referencial: permite a remoção de um prestador se não estiver associado a nenhum serviço
-prestador(A,B,C,D) :: (solucoes(A,servico(_,A,_,_,_),S), comprimento(S,N), N==0).






%Predicado Serviço
%invariante de Inserção Estrutural: não permite a inserção de um prestador se este já existir na base de conhecimento
+servico(A,B,C,D,E) :: (solucoes((A,B,C,D,E),servico(A,B,C,D,E),S), comprimento(S,N), N==1).


%Invariante de Inserção Referencial: não permite a inserção de um servico com o mesmo id
+servico(A,_,_,_,_) :: (solucoes(A,servico(A,_,_,_,_),S), comprimento(S,N), N==1).


%invariante de Remoção Estrutural: permite a remoção de um serviço se este existir na base de conhecimento
-servico(A,B,C,D,E) :: (solucoes((A,B,C,D,E),servico(A,B,C,D,E),S), comprimento(S,N), N==1).





%Predicado consulta
%invariante de Inserção Estrutural: não permite a inserção de uma consulta se esta já existir na base de conhecimento
+consulta(A,B,C,D,E,F) :: (solucoes((A,B,C,D,E,F),consulta(A,B,C,D,E,F),S), comprimento(S,N), N==1).


%Invariante de Inserção Referencial: não permite a inserção de uma consulta com o mesmo id
+consulta(A,_,_,_,_,_) :: (solucoes(A,consulta(A,_,_,_,_,_),S), comprimento(S,N), N==1).


%invariante de Remoção Estrutural: permite a remoção de uma consulta se esta existir na base de conhecimento
-consulta(A,B,C,D,E,F) :: (solucoes((A,B,C,D,E,F),consulta(A,B,C,D,E,F),S), comprimento(S,N), N==1).

