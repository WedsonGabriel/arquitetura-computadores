# Faça um programa que leia um número inteiro e imprima 1 se o valor for ímpar e 0 se o valor for par.

.text
main: 
	# --- ARMAZENAMENTO INICIAL ---
	addi $8, $0, 2 # Número responsável por definir se é impar ou par, por meio do resto da divisão por ele
	
	# --- LEITURA DE DADOS ---
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	# --- PROCESSAMENTO ---
	div $9, $8 # Divisão do inteiro por 2
	mfhi $10 # Resto da divisão
	
	# --- SAÍDA DE DADOS ---
	add $4, $0, $10
	addi $2, $0, 1 # Imprime o resto da divisão
	syscall
	
	# --- ENCERRAMENTO DE PROGRAMA ---
	addi $2, $0, 10
	syscall
