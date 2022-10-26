
from re import *

def substituicao(ciphertext,letra_ingles,lista_ingles):
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
	maximo = 0
	lista = lista_ingles
	letra_maisco= " "
	for caractere in ciphertext and caractere not in lista:
		co = ciphertext.count(caractere)
		if co > maximo:
			letra_maisco = caractere
	subciphertext = ciphetext.sub(letra_maisco, letra_ingles)
	lista.append(letra_ingles)
	print(subciphertext)
	variavel = int(input(("Deseja continuar. Se sim prima 2 se souber a proxima correspondencia. Se nao souber prima 1. Se quiser acabar senao prima 0")))
	

	if variavel == 2:
		letra_cifra = chr(input("Introduza a letra da cifra que quer decifrar: "))
		letra_ing = chr(input("Introduza a letra inglesa para decifrar: "))
		lista.append(letra_ing)
		cripto = subs(subciphertext,letra_cifra,letra_ing)
		print(cripto)
		new_letter=chr(input("Proxima letra é: "))
		substituicao(subciphertext,new_letter,lista)

	elif variavel == 1:
		print("A lista de letras inglesas que usou: " + lista)
		print("Dicionario de ocorrencias das letras inglesas: " + dic1)
		new_letter=chr(input("Proxima letra é:"))
		substituicao(subciphertext,new_letter,lista)


	else:
		print("O texto limpo é \n" + subciphertext)	


	return subciphertext




def subs(ciphertext,letra_cifra, letra_inglesa):
	ciphertext=ciphertext.sub(letra_cifra,letra_inglesa)
	return ciphertext












#print(substituicao(,E[]))