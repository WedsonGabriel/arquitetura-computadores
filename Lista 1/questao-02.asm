# Faça um programa para ler um número inteiro e imprimir o quadrado desse número.

.text
main:
	addi $2, $0, 5 # Ler um inteiro
	syscall
	add $8, $0, $2 # Armazena o dado de $2 no $8
	
	mul $4, $8, $8 # Multiplica o valor de $8 por ele mesmo e o armazena no $4
	addi $2, $0, 1 # Imprime o resultado
	syscall
	
	addi $2, $0, 10 # Finaliza a execução
	syscall