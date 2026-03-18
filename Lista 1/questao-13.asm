# Faça um programa que imprima a frase “Hello World”.

.text
main:
	# --- SAÍDA DE DADOS ---
	addi $4, $0, 'H'
	addi $2, $0, 11 # Imprime o 'H'
	syscall
	
	addi $4, $0, 'e'
	addi $2, $0, 11 # Imprime o 'e'
	syscall
	
	addi $4, $0, 'l'
	addi $2, $0, 11 # Imprime o 'l'
	syscall
	
	addi $4, $0, 'l'
	addi $2, $0, 11 # Imprime o 'l'
	syscall
	
	addi $4, $0, 'o'
	addi $2, $0, 11 # Imprime o 'o'
	syscall
	
	
	
	addi $4, $0, ' '
	addi $2, $0, 11 # Imprime o espaço
	syscall
	
	
	
	addi $4, $0, 'W'
	addi $2, $0, 11 # Imprime o 'W'
	syscall
	
	addi $4, $0, 'o'
	addi $2, $0, 11 # Imprime o 'o'
	syscall
	
	addi $4, $0, 'r'
	addi $2, $0, 11 # Imprime o 'r'
	syscall
	
	addi $4, $0, 'l'
	addi $2, $0, 11 # Imprime o 'l'
	syscall
	
	addi $4, $0, 'd'
	addi $2, $0, 11 # Imprime o 'd'
	syscall
	
	# --- ENCERRAMENTO DE PROGRAMA ---
	addi $2, $0, 10
	syscall
