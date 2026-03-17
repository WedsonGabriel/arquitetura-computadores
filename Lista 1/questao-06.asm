# Faça um programa que leia um número inteiro entre 0 e 999 e imprima esse número com 3 algarismos.
# Ex.: 23 gera uma saída 023. 8 gera uma saída 008.

.text
main:
	# --- BASE NUMÉRICA ---
	addi $8, $0, 10

	# --- LEITURA DE DADOS ---
	addi $2, $0, 5 # Ler o inteiro
	syscall
	add $9, $0, $2 # Adiciona o valor lido em $9
	
	# --- SEPARA O TERCEIRO ALGARISMO ---
	div $9, $8
	mfhi $10 # Resto da divisão de $9 por 10 (IMPRIME ESSE)
	mflo $11 # Quociente da divisão de $9 por 10 (DIVIDE ESSE A SEGUIR)
	
	# --- SEPARA O SEGUNDO ALGARISMO ---
	div $11, $8
	mfhi $12 # Resto da divisão de $11 por 10 (IMPRIME ESSE)
	mflo $13 # Quociente da divisão de $11 por 10 (DIVIDE ESSE A SEGUIR)
	
	# --- SEPARA O PRIMEIRO ALGARISMO ---
	div $13, $8
	mfhi $14 # Resto da divisão de $13 por 10 (IMPRIME ESSE)
	mflo $15 # Quociente da divisão de $13 por 10 (PARA A DIVISÃO)
	
	# --- SAÍDA DE DADOS ---
	add $4, $0, $14
	addi $2, $0, 1
	syscall # Imprime o primeiro algarismo
	
	add $4, $0, $12
	addi $2, $0, 1
	syscall # Imprime o segundo algarismo
	
	add $4, $0, $10
	addi $2, $0, 1
	syscall # Imprime o terceiro algarismo
	
	# --- ENCERRA PROGRAMA ---
	addi $2, $0, 10
	syscall
