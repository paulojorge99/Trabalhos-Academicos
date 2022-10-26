from re import *
from math import *

dic1= {}
dic1['A'] = 8.2
dic1['B'] = 1.5
dic1['C'] = 2.8
dic1['D'] = 4.3
dic1['E'] = 12.7
dic1['F'] = 2.2
dic1['G'] = 2.0
dic1['H'] = 6.1
dic1['I'] = 7.0
dic1['J'] = 0.2
dic1['K'] = 0.8
dic1['L'] = 4.0
dic1['M'] = 2.4
dic1['N'] = 6.7
dic1['O'] = 1.5
dic1['P'] = 1.9
dic1['Q'] = 0.1
dic1['R'] = 6.0
dic1['S'] = 6.3
dic1['T'] = 9.1
dic1['U'] = 2.8
dic1['V'] = 1.0
dic1['W'] = 2.4
dic1['X'] = 0.2
dic1['Y'] = 2.0
dic1['Z'] = 0.1





def tamanho_chave(ciphertext):
	listaS = []
	for s in range(1,len(ciphertext)):
		subciphertext = ciphertext[0:len(ciphertext:s)]  #cria subsequencias da cifra de espaçamento s
		dic = {}
		for i in range(26):                              #para cada uma das subsequencias calcula a frequencia das suas letras e coloca num dicionario
			letter = chr(i+ord('A'))
			co = subciphertext.count(letter)
			fq =(co/len(subciphertext))
			if letter not in dic and fq !=0:
				dic[letter] = fq 
		soma = 0                            
		for key in dic:                                  #para cada subsequencia calcula o valor de S(no livro) e coloca esse valor mais o valor de tau(simbolo no livro) num tuplo
			soma += (dic[key] ** 2)
			listaS.append((soma,s))

	
	for i in range(len(listaS)):                         #verifica qual dos valores se encontra mais proximo de 0.065 e retorna o valor de tau para qual isso acontece. Esse valor é o tamanho da chave
		maisproximo = 1000
		j = 0
		diferenca = mod(listaS[i][0] - 0.065)
		if diferenca < maisproximo:
			maisproximo = diferenca
			j = listaS[i][1]
	tamanchave = j	
	return(tamanchave)




def chave(ciphertext, dicionario):
	dic1 = dicionario	
	tamanho_chave = tamanho_chave(ciphertext)
	dic2 = {}
	Lista_chave=[]
	for i in range(0, len(ciphertext)):
		
		subseq = ciphertext[i:len(ciphertext):tamanho_chave]
		for j in range(26):                             
			letter = chr(j+ord('A'))
			co = subseq.count(letter)
			fq =(co/len(subseq))
			if letter not in dic2 and fq !=0:
				dic2[letter] = fq
		lista = []		
		for k in range(26):
			soma = 0
			for key in dic1:
				if (key in subseq) and chr((j + ord(key))%26)in dic2:
					soma += dic1[key] * dic2[chr((j + ord(key))%26)]
			lista.append((soma,k))
		

		for elemento in lista:
			maisproximo = 1000
			letra = ''
			diferenca = mod(elemento[0] - 0.065)
			if diferenca < maisproximo:
				maisproximo = diferenca
				letra = chr(elemento[1] + ord('A'))
		Lista_chave.append(letra)
	return(Lista_chave)	
    




def decifrar(chave, cripto):

	plaintext = " "
	chave = chave
	for i in range(len(chave)):
		caractere = chr((ord('A')+ord(cripto[i])-(ord('A')+ord(chave[i]))%26))
		plaintext+=caractere
	return plaintext	
		
print(decifrar(chave(...,...),...))







	
