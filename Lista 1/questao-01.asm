# Faça um programa para ler um número inteiro e imprimir o dobro desse número.

.text
main:
	addi $2, $0, 5 # Ler um inteiro
	syscall
	add $8, $0, $2 # Transfere o dado do $2 para o $8

	mul $4, $8, 2 # Multiplica o valor contido no $8 por 2 e adiciona no $4
	addi $2, $0, 1 # Imprime o resultado
	syscall
	
	addi $2, $0, 10 # Finaliza a execu��o
	syscall
	
	
	
	
	
