# Faça um programa que leia um número entre 0 e 9999 e imprima cada algarismo em uma linha diferente.

# Ex.: 3219 imprime
# 9
# 1
# 2
# 3
# Ex.: 123
# 3
# 2
# 1
# 0

.text
main:

	# --- BASE NUMÉRICA ---
	addi $8, $0, 10
	
	# --- LEITURA DE DADOS ---
	addi $2, $0, 5 # Ler um inteiro
	syscall
	add $9, $0, $2 #Adiciona o inteiro lido em $9
	
	# --- SEPARA O QUARTO ALGARISMO ---
	div $9, $8 
	mfhi $10 # Resto da divisão de $9 por 10 (IMPRIME ESSE)
	mflo $11 # Quociente da divisão de $9 por 10 (DIVIDE ESSE A SEGUIR)
	
	# --- SEPARA O TERCEIRO ALGARISMO ---
	div $11, $8
	mfhi $12 # Resto da divisão de $11 por 10 (IMPRIME ESSE)
	mflo $13 # Quociente da divisão de $11 por 10 (DIVIDE ESSE A SEGUIR)
	
	# --- SEPARA O SEGUNDO ALGARISMO ---
	div $13, $8
	mfhi $14 # Resto da divisão de $13 por 10 (IMPRIME ESSE)
	mflo $15 # Quociente da divisão de $13 por 10 (DIVIDE ESSE A SEGUIR)
	
	# --- SEPARA O PRIMEIRO ALGARISMO ---
	div $15, $8
	mfhi $16 # Resto da divisão de $15 por 10 (IMPRIME ESSE)
	mflo $17 # Quociente da divisão de $15 por 10 (DIVIDE ESSE A SEGUIR)
	
	# --- SAÍDA DE DADOS ---
	add $4, $0, $10
	addi $2, $0, 1 #Imprime o quarto algarismo
	syscall
	addi $4, $0, '\n'
	addi $2, $0, 11
	syscall
	
	add $4, $0, $12
	addi $2, $0, 1 #Imprime o terceiro algarismo
	syscall
	addi $4, $0, '\n'
	addi $2, $0, 11
	syscall
	
	add $4, $0, $14
	addi $2, $0, 1 #Imprime o segundo algarismo
	syscall
	addi $4, $0, '\n'
	addi $2, $0, 11
	syscall
	
	add $4, $0, $16
	addi $2, $0, 1 #Imprime o primeiro algarismo
	syscall
	
	# --- ENCERRA O PROGRAMA ---
	addi $2, $0, 10
	syscall
