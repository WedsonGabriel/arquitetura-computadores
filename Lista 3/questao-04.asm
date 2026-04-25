# Faça um programa que leia do usuário um intervalo fechado e imprima os números pares desse intervalo
# (inclusive os limites).

.text
main:
	# --- ARMAZENAMENTO DE DADOS ---
	
	
	# --- ENTRADA DE DADOS ---
	addi $2, $0, 5 # Ler o primeiro número do intervalo (MenorNumero)
	syscall 
	add $8, $0, $2 # Armazena o primeiro número no registrador 8
	
	addi $2, $0, 5 # Ler o último número do intervalo (MaiorNumero)
	syscall
	add $9, $0, $2 # Armazena o último número no registrador 9
	
	
	
	# --- IMPRIME O PRIMEIRO NÚMERO ---
	add $4, $0, $8
	addi $2, $0, 1 # Imprime o primeiro número
	syscall
	addi $4, $0, '\n'
	addi $2, $0, 11 # Imprime uma quebra de linha
	syscall
	
	
	
	# --- INÍCIO DO LAÇO ---
teste:
	beq $8, $9, sai # Se $8==$9, sai fora
	addi $8, $8, 1 # MenorNumero = MenorNumero + 1
	add $4, $0, $8
	addi $2, $0, 1 # Imprime o menor número
	syscall
	addi $4, $0, '\n'
	addi $2, $0, 11 # Imprime a quebra de linha
	syscall
	j teste # Volta para o início do laço
	# --- FIM DO LAÇO ---
	


	# --- ENCERRAMENTO ---
sai:
	addi $2, $0, 10 # Encerra o programa
	syscall
