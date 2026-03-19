# Faça um programa que leia um número inteiro e imprima -1 se o valor for ímpar e 0 se o valor for par.

.text
main:
	# --- ARMAZENAMENTO INICIAL ---
	addi $8, $0, 2 # Divide o número para encontrar o seu resto
	
	# --- LEITURA DE DADOS ---
	addi $2, $0, 5 # Ler um inteiro
	syscall
	add $9, $0, $2 # Armazena o inteiro no $9
	
	# --- PROCESSAMENTO ---
	div $9, $8 # Divide o inteiro por 2
	mfhi $10 # Guarda o resto da divisão no $10
	sub $4, $0, $10 # Transforma o 1 em negativo, pois 0-1 = -1; 
	
	# --- SAÍDA DE DADOS ---
	addi $2, $0, 1 # Imprime o resultado
	syscall
	
	# --- ENCERRAMENTO DO PROGRAMA ---
	addi $2, $0, 10
	syscall
