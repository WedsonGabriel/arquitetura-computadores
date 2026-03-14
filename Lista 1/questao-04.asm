# Faça um programa para ler duas notas de um aluno do IFRN em um curso semestral.
# Esse programa deverá apresentar a média desse aluno, após as duas provas.

.text
main:
	addi $2, $0, 5 # Ler um inteiro
	syscall
	add $8, $0, $2 # Armazena o dado contido em $2 no registrador $8
	
	addi $2, $0, 5 # Ler um inteiro
	syscall
	add $9, $0, $2 # Armazena o dado contido em $2 no registrador $9
	
	add $10, $8, $9 # Soma os valores contidos em $8 e em $9 e os armazena no registrador $10
	addi $11, $0, 2 # Armazena o valor 2 no registrador 11
	div $10, $11 # Divide os valor contido em $10 pelo valor contido em $11
	mflo $4 #Armazena o valor de LO para o registrador $4
	
	addi $2, $0, 1 # Imprime o valor contido em $4
	syscall
	
	addi $2, $0, 10 # Finaliza a execução do programa
	syscall