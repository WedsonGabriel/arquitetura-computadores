# Faça um programa para ler dois números inteiros e imprimir a multiplicação desses dois números

.text
main:
	addi $2, $0, 5 # Ler um inteiro
	syscall
	add $8, $0, $2 # Armazena o dado de $2 no $8 
	
	addi $2, $0, 5 # Ler um inteiro
	syscall
	add $9, $0, $2 # Armazena o dado de $2 no $9
	
	mul $4, $8, $9 # Multiplica o valor contido em $8 pelo valor contido em $9 e armazena o resultado em $4
	addi $2, $0, 1 # Imprime o resultado
	syscall
	
	addi $2, $0, 10 # Finaliza a execução
	syscall