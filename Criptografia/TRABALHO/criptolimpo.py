import re

with open("cripto1.txt") as f1:
	arquivo1=f1.read()
	arq1=re.sub("[^0-9a-zA-Z]+", "", arquivo1)

with open("cript1.txt",'w') as f2:
	f2.write(arq1)



with open("cripto2.txt") as f3:
	arquivo2=f3.read()
	arq2=re.sub("[^0-9a-zA-Z]+", "", arquivo2)

with open("cript2.txt",'w') as f4:
	f4.write(arq2)




with open("cripto3.txt") as f5:
	arquivo3=f5.read()
	arq3=re.sub("[^0-9a-zA-Z]+", "", arquivo3)

with open("cript3.txt",'w') as f6:
	f6.write(arq3)

