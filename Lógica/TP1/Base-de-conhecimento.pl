%Base de conhecimento

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