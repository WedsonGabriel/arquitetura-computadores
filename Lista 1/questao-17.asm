# Faça um programa que leia dois números inteiros e calcule e imprima a média aritmética simples
# desses dois números apresentando o resultado com um algarismo na casa fracionária.
# Ex.: 13 e 6 gera uma saída 9,5

.text
main:
	# --- ARMAZENAMENTO INICIAL ---
	addi $8, $0, 2 # Divide os dois inteiros, para calcular a média
	
	# --- LEITURA DE DADOS ---
	addi $2, $0, 5 # Ler a primeira nota
	syscall
	add $9, $0, $2 # Armazena a primeira nota no registrador 9
	
	addi $2, $0, 5 # Ler a segunda nota
	syscall
	add $10, $0, $2 # Armazena a segunda nota no registrador 10
	
	# --- PROCESSAMENTO ---
	add $11, $9, $10 # Soma as duas notas
	div $11, $8 # Divide a soma das duas notas por 2
	mfhi $12 # Armazena o resto da divisão em $12
	mflo $13 # Armazena o quociente da divisão em $13
	mul $14, $12, 5 # Multiplica o resto da divisão por 5
	
	# --- SAÍDA DE DADOS ---
	add $4, $0, $13
	addi $2, $0, 1 # Imprime o inteiro
	syscall
	
	addi $4, $0, ',' 
	addi $2, $0, 11 # Imprime  a vírgula
	syscall
	
	add $4, $0, $14
	addi $2, $0, 1 # Imprime a casa decimal
	syscall
	
	# --- ENCERRAMENTO DO PROGRAMA ---
	addi $2, $0, 10
	syscall
