# Faça um programa que leia um número inteiro entre 0 e 999 e imprima a soma dos
# algarismos desse número. Ex.: 358 gera uma saída de 16, pois 3+5+8 = 16

.text
main:
	addi $2, $0, 5 # Ler um inteiro
	syscall
	add $8, $0, $2 # Adiciona o inteiro no registrador 8
	
	addi $9, $0, 10 # Adiciona o inteiro 10 no registrador 9
	div $8, $9 # Divide o valor contido no registrador 8 pelo valor 10 contido no registrador 9
	mfhi $10 #Adiciona o resto da divisão de $8 por $9 no registrador 10
	mflo $11 #Adiciona o quociente no registrador 11
	
	div $11, $9 # Divide o valor contido no registrador 11 pelo valor 10 contido no registrador 9
	mfhi $12 #Adiciona o resto da divisão de $10 por $9 no registrador 11
	mflo $13 #Adiciona o quociente no registrador 13
	
	div $13, $9 # Divide o valor contido no registrador 13 pelo valor 10 contido no registrador 9
	mfhi $14 #Adiciona o resto da divisão de $13 por $9 no registrador 14
	mflo $15 #Adiciona o quociente no registrador 15
	
	add $16, $10, $12 # Soma os restos de divisão contidos em $10 e $12, e os armazena registrador 16
	add $17, $16, $14 # Soma o valor contido em $16 com o valor contido em $14, e o armazena em $17
	add $4, $0, $17 # Armazena o valor contido em $17 no registrador 4
	
	addi $2, $0, 1 # Imprime o resultado
	syscall
	
	addi $2, $0, 10 # Encerra a execução do programa
	syscall
