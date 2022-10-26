
from re import *


def affine_letras(ciphertext):
	ncaracteres = [" ",",",";",".",")","(","-","/n"]
	lista_fq = []
	for letra in ciphertext and not in ncaracteres:
		co = ciphertext.count(letra)
		fq = co/len(ciphertext)
		lista_fq.append(lista_fq)
	lista_fq = lista_fq.sort()
	maior = lista_fq[len(lista_fq)-1]
	segmaior = lista_fq[len(lista_fq)-2]
	numero_maior = ord(maior)
	numero_segmaior = ord(segmaior)
	num_E = ord('E')
	num_T = ord('T')
	calculo_inv_a = ((num_E - 65)-(num_T -65))/((numero_maior-65)-(numero_segmaior-65))
	calculo_b = ((numero_segmaior-65)-6)/(calculo_inv_a)
	texto_limpo = decifrar(calculo_inv_a,calculo_b,ciphertext)
	print(texto_limpo)

def decifrar(inv_a,b,cripto):
	plaintext = " "
	for caractere in cripto:
		letra = (inv_a*((ord('A')+ord(caractere))-b)) %26
		plaintext+=letra
	return plaintext	


print(affine_letras(...))






import sys
import os

def inversa(numero):
	for i in range(0,27):
		if ((numero*i) % 26)==1:
			return i
		else:
			sys.exit("Nao existe inversa para %d" %numero)	


def affine():
	file = open(sys.argv[-1],'r')
	ciphertext = file.read()
	ncaracteres = [" ",",",";",".",")","(","-","/n"]
	for a in range(0,26):
		if (a%2 != 0) and (a != 13):
			for b in range(0,26):
				continuar = int(input("Deseja continuar prima 1 senao prima 0: "))
				plaintext=" "
				if continuar == 0:
					break
				if continuar==1:
					inversa = inversa(a)
					for caractere in ciphertext:
						if caractere not in ncaracteres:
							num = ord(caractere)
							car_plaintext = chr(ord('A') + ((inv*(num - b)) % 26))
							plaintext += car_plaintext
						else:
							plaintext += caractere
					print(plaintext)			
	

