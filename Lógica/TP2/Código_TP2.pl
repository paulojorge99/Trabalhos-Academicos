%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% SICStus PROLOG: definicoes iniciais
:- op(900,xfy,'::').
:- op(300,xfy,ou).
:- op(300,xfy,e).
:- dynamic utente/8.
:- dynamic prestador/4.
:- dynamic consulta/5.
:- dynamic servico/5.
:- dynamic '-'/1.
:- dynamic excecao/1.
:- dynamic interdito/1.
:- dynamic (::)/2.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%Conhecimento perfeito positivo

%predicado utente: IdUt, Nome, Idade, Cidade, Pai, Mãe, NIF,doenca  -> {V,F,D}
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


%predicado servico: Idserv, IdPrest,Descrição, Instituição, Cidade -> {V,F,D}
servico(200,1005,oscultar,hospitaldatrofa,trofa).
servico(201,1003,medirtensao,hospitaldatrofa,trofa).
servico(202,1010,analises,hospitalsantaluzia,vianadocastelo).
servico(203,1004,medirfebre,hospitalpublicodebraga,braga).
servico(204,1006,analisessecrecoes,hospitalprivadodebraga,braga).
servico(205,1002,medirtensao,hospitalpublicodebraga,braga).
servico(206,1001,oscultar,hospitalpublicodebraga,braga).
servico(207,1008,oscultar,hospitalprivadodebraga,braga).
servico(208,1004,analises,hospitalpublicodebraga,braga).


%predicado consulta: IdCons, Data, IdUt, IdServ, Custo -> {V,F,D}
consulta(1,06112020,100,200,80).
consulta(2,10102020,105,204,110).
consulta(3,22122020,110,206,30).
consulta(4,25112020,109,208,25).
consulta(5,30112020,106,203,30).
consulta(6,10102020,109,202,60).
consulta(7,06112020,107,206,30).
consulta(8,25112020,102,203,35).
consulta(9,30112020,110,206,30).
consulta(10,10102020,103,203,40).
consulta(11,06112020,104,203,25).
consulta(12,30112020,109,208,35).


%predicado prestador: IdPrest, Nome, Especialidade, Instituição -> {V,F,D}
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


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%Conhecimento perfeito negativo


%predicado utente
-utente(A,B,C,D,E,F,G,H):-
nao(utente(A,B,C,D,E,F,G,H)),
nao(excecao(utente(A,B,C,D,E,F,G,H))).

-utente(114,eduardoramalho,24,braga,manuelramalho,sararamalho,222123455,covid).
-utente(115,andrelopes,50,vilanovadegaia,carloslopes,veralopes,331115654,asma).
-utente(116,pedropastor,45,famalicao,henriquepastor,dianapastor,756832122,febre).
-utente(117,tiagomatos,20,braga,josematos,luisamatos,777123123,covid).



%predicado servico
-servico(I,J,K,L,M):-
nao(servico(I,J,K,L,M)),
nao(excecao(servico(I,J,K,L,M))).

-servico(220,1008,oscultar,hospitalprivadodebraga,braga).
-servico(221,1002,medirtensao,hospitalpublicodebraga,braga).
-servico(222,1001,oscultar,hospitalpublicodebraga,braga).


%predicado consulta
-consulta(N,O,A,I,P):-
nao(consulta(N,O,A,I,P)),
nao(excecao(consulta(N,O,A,I,P))).

-consulta(20,12082020,100,201,30).
-consulta(21,20112020,101,202,80).
-consulta(22,22112020,102,203,20).




%predicado prestador
-prestador(Q,R,S,T):-
nao(prestador(Q,R,S,T)),
nao(excecao(prestador(Q,R,S,T))).

-prestador(1020,fabiomarques,pneumologista,hospitalpublicodebraga).
-prestador(1021,marciahenriqueta,medicinageral,hospitalpublicodebraga).
-prestador(1022,eduardapauleta,pediatra,hospitalsantaluzia).
-prestador(1023,otaviosoares,endocrinologia,hospitaldatrofa).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%Conhecimento desconhecido

%Conhecimento incerto
utente(111,isabelfreitas,22,cidade,gabrielfreitas,anafreitas,888811345,asma).
excecao(utente(A,B,C,D,E,F,G,H)):- utente(A,B,C,cidade,E,F,G,H).

utente(112,nunamario,idade,porto,diogomario,isabelmario,543524153,covid).
excecao(utente(A,B,C,D,E,F,G,H)):- utente(A,B,idade,D,E,F,G,H).

servico(209,prestador,oscultar,hospitaldatrofa,trofa).
excecao(servico(I,J,K,L,M)):- servico(I,prestador,K,L,M).

servico(210,prestador1,oscultar,hospitalprivadodebraga,braga).
excecao(servico(I,J,K,L,M)):- servico(I,prestador1,K,L,M).

consulta(14,data,107,206,45).
excecao(consulta(N,O,A,I,P)):- consulta(N,data,A,I,P).

consulta(15,13092021,110,206,custo).
excecao(consulta(N,O,A,I,P)):- consulta(N,O,A,I,custo).

prestador(1011,fabiotigre,especialidade,hospitalpublicodebraga).
excecao(prestador(Q,R,S,L)):- prestador(Q,R,especialidade,L).

prestador(1012,franciscolopes,especialidade1,hospitalsantaluzia).
excecao(prestador(Q,R,S,L)):- prestador(Q,R,especialidade1,L).



%conhecimento impreciso

excecao(utente(120,cristinaferreira,25, barcelos,fabioferreira,joanaferreira,222255556,asma)).
excecao(utente(120,cristinaferreira,25, barcelos,fabioferreira,joanaferreira,222255556,covid)).

excecao(utente(121,rodrigolima,PO,porto,joaolima,analima,535454545,covid)) :-  PO>=20, PO =< 30.


excecao(servico(230,diogoamaral,medirtensao,hospitaldatrofa,trofa)).
excecao(servico(230,tiagoborges,medirtensao,hospitaldatrofa,trofa)).


excecao(consulta(25,15062021,106,205,CO)):- CO>=70, CO=<80.


excecao(prestador(1030,nunolopes,pneumologista,hospitalpublicodebraga)).
excecao(prestador(1030,nunolopes,pediatra,hospitalpublicodebraga)).



%conhecimento interdito

utente(130,joseramalho,48,cidade1,inacioramalho,albertinaramalho,345343431,covid).
excecao(utente(A,B,C,D,E,F,G,H)):- utente(A,B,C,cidade1,E,F,G,H).
interdito(cidade1).
+utente(A,B,C,D,E,F,G,H)::(solucoes(D,(utente(130,joseramalho,48,D,inacioramalho,albertinaramalho,345343431,covid),nao(interdito(D))),T),
							comprimento(T,Z),Z==0).



servico(240,eduardovieira,analisessecrecoes,instituicao,braga).
excecao(servico(I,J,K,L,M)):- servico(I,J,K,instituicao,M).
interdito(instituicao).
+servico(I,J,K,L,M)::(solucoes(L,(servico(240,eduardovieira,analisessecrecoes,L,braga),nao(interdito(L))),T),comprimento(T,Z),Z==0).


consulta(40,31082021,105,201,custo3).
excecao(consulta(N,O,A,I,P)):-consulta(N,O,A,I,custo3).
interdito(custo3).
+consulta(N,O,A,I,P)::(solucoes(P,(consulta(40,31082021,105,201,P),nao(interdito(P))),T),comprimento(T,Z),Z==0).


prestador(1040,gabrielmario,especialidade3,hospitalpublicodebraga).
excecao(prestador(Q,R,S,L)):-prestador(Q,R,especialidade3,L).
interdito(especialidade3).
+prestador(Q,R,S,L)::(solucoes(S,(prestador(1040,gabrielmario,S,hospitalpublicodebraga),nao(interdito(S))),T),comprimento(T,Z),Z==0).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%Extensao do predicado solucoes: X,Y,Z --> {V,F}

solucoes(X,Y,Z):-findall(X,Y,Z).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -


%Extensao do predicado comprimento: Lista, Resultado --> {V,F}


comprimento([],0).
comprimento([X|L],R):- comprimento(L,N), R is N+1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :-
    Questao, !, fail.
nao( Questao ).

%----------------------------------------------------------------------

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

%----------------------------------------------------------------------


%extensão do predicado que permite a involução do conhecimento: Termo ->{V,F}

involucao(Termo) :- solucoes(Inv, -Termo::Inv, Linv), testar(Linv), remover(Termo).


%extensão do predicado que permite a remoção do termo: Termo ->{V,F}

remover(Termo) :- retract(Termo).
remover(Termo) :- assert(Termo), !, fail.


%extensão do predicado que permite testar os invariantes de uma lista: Termo ->{V,F}

testar([]).
testar([I|R]) :- I,testar(R).

%----------------------------------------------------------------------

% Extensao do meta-predicado si: Questao,Resposta -> {V,F}

si( Questao,verdadeiro ) :-
    Questao.
si( Questao,falso ) :-
    -Questao.
si( Questao,desconhecido ) :-
    nao( Questao ),
    nao( -Questao ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% siC ou siD para composicao de valores de verdade --> {V,F}

siC( Q1 e Q2,R ) :- siand( Q1,R1 ), siand( Q2,R2 ), conjuncao(R1,R2,R).
siand(siC(Q1 e Q2),R):-siand(Q1,R1),siand(Q2,R2),conjuncao(R1,R2,R).
siand(siD(Q1 ou Q2),R):-siand(Q1,R1),siand(Q2,R2),disjuncao(R1,R2,R).
siand(A,B) :- si(A,B).




siD( Q3 ou Q4,S ) :- sior( Q3,R3 ), sior( Q4,R4 ), disjuncao(R3,R4,S).
sior(siD(Q3 ou Q4),S):-sior(Q3,R3),sior(Q4,R4),disjuncao(R3,R4,S).
sior(siC(Q3 e Q4),S):-sior(Q3,R3),sior(Q4,R4),conjuncao(R3,R4,S).
sior(A,B) :- si(A,B).


disjuncao(verdadeiro,verdadeiro,verdadeiro).
disjuncao(verdadeiro,desconhecido,desconhecido).
disjuncao(verdadeiro,falso,verdadeiro).
disjuncao(desconhecido,verdadeiro,desconhecido).
disjuncao(desconhecido,desconhecido,desconhecido).
disjuncao(desconhecido,falso,falso).
disjuncao(falso,verdadeiro,verdadeiro).
disjuncao(falso,desconhecido,falso).
disjuncao(falso,falso,falso).

conjuncao(verdadeiro,verdadeiro,verdadeiro).
conjuncao(verdadeiro,desconhecido,verdadeiro).
conjuncao(verdadeiro,falso,falso).
conjuncao(desconhecido,verdadeiro,verdadeiro).
conjuncao(desconhecido,desconhecido,desconhecido).
conjuncao(desconhecido,falso,desconhecido).
conjuncao(falso,verdadeiro,falso).
conjuncao(falso,desconhecido,desconhecido).
conjuncao(falso,falso,falso).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -


% Extensao do predicado que permite a evolucao do conhecimento positivo para outro positivo: Qnovo,Qpassado --> {V,F}

evolucao_PP(Qnovo, Qpassado):-
si(Qpassado, verdadeiro),
involucao(Qpassado),
evolucao(Qnovo).

% Extensao do predicado que permite a evolucao do conhecimento negativo para positivo: Qnovo --> {V,F}

evolucao_NP(Qnovo):-
si(-Qnovo,verdadeiro),
remover(-Qnovo),
evolucao(Qnovo).

% Extensao do predicado que permite a evolucao do conhecimento positivo para negativo: Qnovo --> {V,F}
evolucao_PN(Qnovo):-
si(Qnovo,verdadeiro),
involucao(Qnovo),
inserir(-Qnovo).

% Extensao do predicado que permite a evolucao do conhecimento positivo para incerto: Qnovo, Qnovo_ex, Qnovo_exx,Qpassado --> {V,F}
evolucao_PInc(Qnovo,Qnovo_ex, Qnovo_exx, Qpassado):-
si(Qpassado,verdadeiro),
involucao(Qpassado),
inserir(Qnovo),
inserir((excecao(Qnovo_ex) :- Qnovo_exx)).


% Extensao do predicado que permite a evolucao do conhecimento positivo para impreciso: Qnovo1,Qnovo2, Qpassado --> {V,F}
evolucao_PImp(Qnovo1,Qnovo2, Qpassado):-
si(Qpassado,verdadeiro),
involucao(Qpassado),
evolucao(excecao(Qnovo1)),
evolucao(excecao(Qnovo2)).


% Extensao do predicado que permite a evolucao do conhecimento impreciso para incerto: Qnovo, Qnovo_ex, Qnovo_exx, Qpassado1, Qpassado2 --> {V,F}
evolucao_ImpInc(Qnovo,Qnovo_ex, Qnovo_exx, Qpassado1, Qpassado2):-
si(Qpassado1,desconhecido),
si(Qpassado2,desconhecido),
involucao(excecao(Qpassado1)),
involucao(excecao(Qpassado2)),
inserir(Qnovo),
inserir((excecao(Qnovo_ex) :- Qnovo_exx)).



% Extensao do predicado que permite a evolucao do conhecimento positivo para interdito: Qnovo, Qnovo_ex, Qnovo_exx, Qnovo2, Qnovo3,Qpassado --> {V,F}
evolucao_PInt(Qnovo, Qnovo_ex, Qnovo_exx, Qnovo2, Qnovo3,Qpassado):-
si(Qpassado,verdadeiro),
involucao(Qpassado),
inserir(Qnovo),
inserir((excecao(Qnovo_ex) :- Qnovo_exx)),
inserir(Qnovo2),
inserir(Qnovo3).


% Extensao do predicado que permite a evolucao do conhecimento interdito para positivo: Qnovo, Qpassado,Qpassado2, Qpassado3,Qpassado4, Qpassado5 --> {V,F}
evolucao_IntP(Qnovo, Qpassado,Qpassado2, Qpassado3,Qpassado4, Qpassado5):-
si(Qpassado,verdadeiro),
remover(Qpassado),
remover((excecao(Qpassado2) :- Qpassado3)),
remover(Qpassado4),
remover(Qpassado5),
evolucao(Qnovo).




% Extensao do predicado que permite a evolucao do conhecimento impreciso para positivo: Qnovo, Qpassado1, Qpassado2 --> {V,F}
evolucao_ImpP(Qnovo,Qpassado1,Qpassado2):-
si(Qpassado1,desconhecido),
si(Qpassado2,desconhecido),
involucao(excecao(Qpassado1)),
involucao(excecao(Qpassado2)),
evolucao(Qnovo).



% Extensao do predicado que permite a evolucao do conhecimento incerto para positivo: Qnovo, Qpassado--> {V,F}
evolucao_IncP(Qnovo, Qpassado):-
si(Qpassado,verdadeiro),
remover(Qpassado),
evolucao(Qnovo).




% Extensao do predicado que permite a evolucao do conhecimento incerto para impreciso: Qnovo1, Qnovo2, Qpassado --> {V,F}
evolucao_IncImp(Qnovo1,Qnovo2, Qpassado):-
si(Qpassado,verdadeiro),
remover(Qpassado),
evolucao(excecao(Qnovo1)),
evolucao(excecao(Qnovo2)).

%----------------------------------------------------------------------


%Atualizar utente

atualizar_utente(utente(A,B,C,D,E,F,G,H), utente(A,B,Cn,Dn,E,F,G,Hn)):-
involucao(utente(A,B,C,D,E,F,G,H)),
evolucao(utente(A,B,Cn,Dn,E,F,G,Hn)).


%Atualizar prestador

atualizar_prestador(prestador(I,J,K,L), prestador(I,J,Kn,Ln)):-
involucao(prestador(I,J,K,L)),
evolucao(prestador(I,J,Kn,Ln)).

%Atualizar servico

atualizar_servico(servico(M,I,N,L,O), servico(M,In,N,L,O)):-
involucao(servico(M,I,N,L,O)),
evolucao(servico(M,In,N,L,O)).


%Atualizar consulta

atualizar_consulta(consulta(P,Q,A,M,R), consulta(P,Qn,A,Mn,Rn)):-
involucao(consulta(P,Q,A,M,R)),
evolucao(consulta(P,Qn,A,Mn,Rn)).


%----------------------------------------------------------------------
%INVARIANTES


%Predicado Utente
%invariante de Inserção Estrutural: não permite a inserção de um utente se este já existir na base de conhecimento
+utente(A,B,C,D,E,F,G,H) :: (solucoes((A,B,C,D,E,F,G,H),utente(A,B,C,D,E,F,G,H),S), comprimento(S,N), N==1).

%Invariante de Inserção Referencial: não permite a inserção de um utente com o mesmo id
+utente(A,_,_,_,_,_,_,_) :: (solucoes(A,utente(A,_,_,_,_,_,_,_),S), comprimento(S,N), N==1).


%Invariante de Inserção Referencial: não permite a inserção de um utente com o mesmo nif
+utente(_,_,_,_,_,_,N,_) :: (solucoes(N,utente(_,_,_,_,_,_,N,_),S), comprimento(S,R), R==1).


%invariante de Remoção Estrutural: permite a remoção de um utente se este existir na base de conhecimento
-utente(A,B,C,D,E,F,G,H) :: (solucoes((A,B,C,D,E,F,G,H),(utente(A,B,C,D,E,F,G,H)),S), comprimento(S,N), N == 1).


%Invariante de Remoção Referencial: permite a remoção de um utente se não estiver associado a nenhuma consulta
-utente(A,B,C,D,E,F,G,H) :: (solucoes(A,consulta(T,Y,A,V,Z,J),S), comprimento(S,N), N==0).


%invariante de Inserção Estrutural: não permite a inserção de conhecimento perfeito negativo que já se encontre na base de dados
+(-utente(A,B,C,D,E,F,G,H)) :: (solucoes((A,B,C,D,E,F,G,H),-utente(A,B,C,D,E,F,G,H),S), comprimento(S,N), N==1).


%Invariante de Inserção Referencial: não permite a inserção de conhecimento perfeito negativo de um utente com o mesmo id
+(-utente(A,_,_,_,_,_,_,_)) :: (solucoes(A,-utente(A,_,_,_,_,_,_,_),S), comprimento(S,N), N==1).


%Invariante de Inserção Referencial: não permite a inserção de conhecimento perfeito negativo de um utente com o mesmo nif
+(-utente(_,_,_,_,_,_,N,_)) :: (solucoes(N,-utente(_,_,_,_,_,_,N,_),S), comprimento(S,R), R==1).


%invariante de Inserção Estrutural: não permite a inserção de uma excecao de utente se esta já existir na base de conhecimento
+(excecao(utente(A,B,C,D,E,F,G,H))) :: (solucoes((A,B,C,D,E,F,G,H),excecao(utente(A,B,C,D,E,F,G,H)),S), comprimento(S,N), N==1).


%invariante de Remoção Estrutural: permite a remoção de conhecimento perfeito negativo de um utente se este existir na base de conhecimento
-(-utente(A,B,C,D,E,F,G,H)) :: (solucoes((A,B,C,D,E,F,G,H),-utente(A,B,C,D,E,F,G,H),S), comprimento(S,N), N == 1).


%invariante de Remoção Estrutural: permite a remoção de excecao de um utente se esta existir na base de conhecimento
-excecao(utente(A,B,C,D,E,F,G,H)) :: (solucoes((A,B,C,D,E,F,G,H),excecao(utente(A,B,C,D,E,F,G,H)),S), comprimento(S,N), N == 1).




%Predicado Prestador
%invariante de Inserção Estrutural: não permite a inserção de um prestador se este já existir na base de conhecimento
+prestador(A,B,C,D) :: (solucoes((A,B,C,D),prestador(A,B,C,D),S), comprimento(S,N), N==1).


%Invariante de Inserção Referencial: não permite a inserção de um prestador com o mesmo id
+prestador(A,_,_,_) :: (solucoes(A,prestador(A,_,_,_),S), comprimento(S,N), N==1).


%invariante de Remoção Estrutural: permite a remoção de um prestador se este existir na base de conhecimento
-prestador(A,B,C,D) :: (solucoes((A,B,C,D),prestador(A,B,C,D),S), comprimento(S,N), N==1).

%Invariante de Remoção Referencial: permite a remoção de um prestador se não estiver associado a nenhum serviço
-prestador(A,B,C,D) :: (solucoes(A,servico(_,A,_,_,_),S), comprimento(S,N), N==0).


%invariante de Inserção Estrutural: não permite a inserção de conhecimento perfeito negativo se este já existir na base de conhecimento
+(-prestador(A,B,C,D)) :: (solucoes((A,B,C,D),-prestador(A,B,C,D),S), comprimento(S,N), N==1).


%Invariante de Inserção Referencial: não permite a inserção de conhecimento perfeito negativo de um prestador com o mesmo id
+(-prestador(A,_,_,_)) :: (solucoes(A,-prestador(A,_,_,_),S), comprimento(S,N), N==1).


%invariante de Inserção Estrutural: não permite a inserção de uma excecao de prestador se esta já existir na base de conhecimento
+excecao(prestador(A,B,C,D)) :: (solucoes((A,B,C,D),excecao(prestador(A,B,C,D)),S), comprimento(S,N), N==1).


%invariante de Remoção Estrutural: permite a remoção de conhecimento perfeito negativo um prestador se este existir na base de conhecimento
-(-prestador(A,B,C,D)) :: (solucoes((A,B,C,D),-prestador(A,B,C,D),S), comprimento(S,N), N==1).


%invariante de Remoção Estrutural: permite a remoção de uma excecao de um prestador se esta existir na base de conhecimento
-excecao(prestador(A,B,C,D)) :: (solucoes((A,B,C,D),excecao(prestador(A,B,C,D)),S), comprimento(S,N), N==1).




%Predicado Serviço
%invariante de Inserção Estrutural: não permite a inserção de um servico se este já existir na base de conhecimento
+servico(A,B,C,D,E) :: (solucoes((A,B,C,D,E),servico(A,B,C,D,E),S), comprimento(S,N), N==1).


%Invariante de Inserção Referencial: não permite a inserção de um servico com o mesmo id
+servico(A,_,_,_,_) :: (solucoes(A,servico(A,_,_,_,_),S), comprimento(S,N), N==1).


%invariante de Remoção Estrutural: permite a remoção de um serviço se este existir na base de conhecimento
-servico(A,B,C,D,E) :: (solucoes((A,B,C,D,E),servico(A,B,C,D,E),S), comprimento(S,N), N==1).


%invariante de Inserção Estrutural: não permite a inserção de conhecimento perfeito negativo de um servico se este já existir na base de conhecimento
+(-servico(A,B,C,D,E)) :: (solucoes((A,B,C,D,E),-servico(A,B,C,D,E),S), comprimento(S,N), N==1).


%Invariante de Inserção Referencial: não permite a inserção de um servico com o mesmo id
+(-servico(A,_,_,_,_)) :: (solucoes(A,-servico(A,_,_,_,_),S), comprimento(S,N), N==1).


%invariante de Inserção Estrutural: não permite a inserção de conhecimento perfeito negativo de um servico se este já existir na base de conhecimento
+excecao(servico(A,B,C,D,E)) :: (solucoes((A,B,C,D,E),excecao(servico(A,B,C,D,E)),S), comprimento(S,N), N==1).

%invariante de Remoção Estrutural: permite a remoção de conhecimento perfeito negativo um serviço se este existir na base de conhecimento
-(-servico(A,B,C,D,E)) :: (solucoes((A,B,C,D,E),-servico(A,B,C,D,E),S), comprimento(S,N), N==1).


%invariante de Remoção Estrutural: permite a remoção de uma excecao de um serviço se este existir na base de conhecimento
-excecao(servico(A,B,C,D,E)) :: (solucoes((A,B,C,D,E),excecao(servico(A,B,C,D,E)),S), comprimento(S,N), N==1).




%Predicado consulta
%invariante de Inserção Estrutural: não permite a inserção de uma consulta se esta já existir na base de conhecimento
+consulta(A,B,C,D,E) :: (solucoes((A,B,C,D,E),consulta(A,B,C,D,E),S), comprimento(S,N), N==1).


%Invariante de Inserção Referencial: não permite a inserção de uma consulta com o mesmo id
+consulta(A,_,_,_,_) :: (solucoes(A,consulta(A,_,_,_,_),S), comprimento(S,N), N==1).


%invariante de Remoção Estrutural: permite a remoção de uma consulta se esta existir na base de conhecimento
-consulta(A,B,C,D,E) :: (solucoes((A,B,C,D,E),consulta(A,B,C,D,E),S), comprimento(S,N), N==1).


%invariante de Inserção Estrutural: não permite a inserção de conhecimento perfeito negativo uma consulta se esta já existir na base de conhecimento
+(-consulta(A,B,C,D,E)) :: (solucoes((A,B,C,D,E),-consulta(A,B,C,D,E),S), comprimento(S,N), N==1).


%Invariante de Inserção Referencial: não permite a inserção de conhecimento perfeito negativo de uma consulta com o mesmo id
+(-consulta(A,_,_,_,_)) :: (solucoes(A,-consulta(A,_,_,_,_),S), comprimento(S,N), N==1).


%invariante de Inserção Estrutural: não permite a inserção de uma consulta se esta já existir na base de conhecimento
+excecao(consulta(A,B,C,D,E)) :: (solucoes((A,B,C,D,E),excecao(consulta(A,B,C,D,E)),S), comprimento(S,N), N==1).


%invariante de Remoção Estrutural: permite a remoção de conhecimento perfeito negativo de uma consulta se esta existir na base de conhecimento
-(-consulta(A,B,C,D,E)) :: (solucoes((A,B,C,D,E),-consulta(A,B,C,D,E),S), comprimento(S,N), N==1).


%invariante de Remoção Estrutural: permite a remoção de uma excecao de uma consulta se esta existir na base de conhecimento
-excecao(consulta(A,B,C,D,E)) :: (solucoes((A,B,C,D,E),excecao(consulta(A,B,C,D,E)),S), comprimento(S,N), N==1).