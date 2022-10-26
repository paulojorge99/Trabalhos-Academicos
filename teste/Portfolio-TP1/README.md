# Portfolio-TP1
**Explicação do projeto prático 1 de Publicação Eletrónica**

No nosso portfólio, todos os reports poderão ser de dois tipos,isto é, existem duas estruturas genéricas para os relatórios. Uma estrutura corresponde a ter um titulo, subtitulo, imagem de capa, autores, informaçao do curso, introducao, estrutura do tipo: questao e respetiva resposta e resolucao, referencias e um link para o relatorio em pdf. A outra estrutura apresenta um titulo, subtitulo, imagem de capa, autores, informaçao do curso, introducao, texto com informacao relevante do assunto do relatorio, imagem final, conclusao, referencias e um link para o relatorio em pdf. Por esse motivo temos dois tipos de templates para gerar as páginas dos relatórios em HTML. Cada relatório é obrigado a ter um título, subtítulo(para termos uma página index), autores(para termos uma página autores), introdução, conclusão e referências e um link desse relatório em pdf. É também obrigado a ter um tipo e uma description(para termos uma página description), onde se encontra o tema do relatório.


Para correr o nosso código basta colocar na linha de comandos "python3 template.py". Ao fazê-lo, irão aparecer os seguintes ficheiros com a extensão .html: uma página index.html, onde estão presentes os relatórios identificados pelos seus subtítulos, os autores que ao clicar irá redirecionar para uma página onde estão os autores de cada relatório e ao clicar em cada nome do autor irá redirecionar para o relatório que foi escrito por ele e uma description em que ao clicar irá redirecionar para uma página onde estão os temas e os respetivos relatórios de cada tema.


Para além disto temos um ficheiro designado por portfolio.dtd, onde está presente o DTD do portfolio, evidenciando que este se encontra bem formado.(xmllint -dtdvalid portfolio.dtd portfolio.xml).


Relativamente ao ficheiro template.py, este apresenta todo o nosso código onde se encontra tudo bem comentado. Portanto, ao correr na linha de comandos aquele comando anteriormente referido, irão aparecer na pasta um certo número de ficheiros correspondentes ao número de relatórios presentes no nosso portfólio, um ficheiro designado por index.html, um ficheiro designado por autores.html, um ficheiro designado por description.html e um ficheiro designado por explicacao.html que corresponde a esta página. Basta clicar no ficheiro index.html, pois a partir daí pode aceder a qualquer um dos outros.


Além de tudo isto temos uma página html (dados_pessoais.html) onde estão os nossos dados pessoais caso necessitem de entrar em contacto.


A pasta RESULTADOS tem todos os ficheiros obtidos correndo na linha de comandos "python3 template.py". Usando o ficheiro INDEX, conseguimos aceder a todos as outras páginas. (de notar que o ficheiro "dados_pessoais.html" - não proveniente do ficheiro  "template.py"  - está repetido dentro da pasta, para o caso de o professor não correr na linha de comandos, e usar apenas os ficheiros da pasta resultados).

Caso o professor coloque na linha de comandos "python3 template.py", são criados todos os ficheiros .html  na pasta corrente (devem ser vistos a partir do INDEX) e a pasta "resultados" deve ser ignorada.
