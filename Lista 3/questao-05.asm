# Faça um programa que leia 10 valores e imprima a sua soma.

.text
main:
	# --- ARMAZENAMENTO DE DADOS ---
	addi $8, $0, 0 # i = 0
	addi $9, $0, 10 # Valor limite
	
	# --- INÍCIO DO LAÇO ---
teste:
	beq $8, $9, sai # Quando i for igual ao valor limite, sai fora
	addi $8, $8, 1 # i = i + 1
	addi $2, $0, 5 # Ler um valor
	syscall
	add $10, $0, $2 # Armazena o valor no registrador 10
	add $11, $11, $10 # Soma o valor lido com o armazenado no registrador 11 (Inicialmente vazio)
	add $4, $0, $11 
	addi $2, $0, 1 # Imprime uma soma
	syscall
	addi $4, $0, '\n' 
	addi $2, $0, 11 # Imprime uma quebra de linha
	syscall
	j teste # Retorna para o início do laço
	# --- FIM DO LAÇO ---
	
	# --- ENCERRAMENTO ---
sai: 
	addi $2, $0, 10 # Encerra o programa
	syscall
