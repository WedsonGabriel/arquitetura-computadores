# Faça um programa que leia 1 inteiro entre 100 e 999 e o imprima escrito de trás para frente. 
# Exemplo: 384 gera uma saída 483

.text
main: 
	# --- ARMAZENAMENTO INICIAL ---
	addi $8, $0, 10
	
	# --- LEITURA DE DADOS ---
	addi $2, $0, 5 # Ler um inteiro
	syscall
	add $9, $0, $2 # Armazena o inteiro no registrador 9
	
	# --- PROCESSAMENTO ---
	div $9, $8
	mfhi $10 # Resto de divisão (Imprime esse) - Terceiro Algarismo
	mflo $11 # Quociente (Divide esse a seguir)
	
	div $11, $8
	mfhi $12 # Resto de divisão (Imprime esse) - Segundo Algarismo
	mflo $13 # Quociente (Divide esse a seguir)
	
	div $13, $8
	mfhi $14 # Resto de divisão (Imprime esse) - Primeiro Algarismo
	mflo $15 # Quociente (Divide esse a seguir)
	
	# --- SAÍDA DE DADOS ---
	add $4, $0, $10
	addi $2, $0, 1 # Imprime o terceiro algarismo
	syscall
	
	add $4, $0, $12
	addi $2, $0, 1 # Imprime o segundo algarismo
	syscall
	
	add $4, $0, $14
	addi $2, $0, 1 # Imprime o primeiro algarismo
	syscall
	
	# --- ENCERRA O PROGRAMA ---
	addi $2, $0, 10
	syscall
