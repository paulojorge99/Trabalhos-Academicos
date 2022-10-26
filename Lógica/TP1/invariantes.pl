:- set_prolog_flag( unknown,fail ).
:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- op( 900,xfy,'::' ).



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







