# Faça uma função que receba um número inteiro positivo n e calcule o seu fatorial, n!

.text
main:
	# --- ENTRADA DE DADOS ---
	addi $2, $0, 5 # Ler um inteiro
	syscall
	add $8, $0, $2 # Armazena o inteiro no registrador 8
	jal fatorial
	
	# --- SAÍDA DE DADOS ---
return:
	add $4, $0, $2 # Armazena o valor contido em $2 no registrador 4
	addi $2, $0, 1 # Imprime o fatorial
	syscall
	
	# --- ENCERRAMENTO ---
	addi $2, $0, 10 # Encerra o programa
	syscall
	
	# --- FUNÇÃO ---
fatorial:
	add $4, $0, $8 # Armazena o inteiro no registrador 4
	addi $2, $0, 1 # Inicia o $2 com o valor 1
	
	# --- Início do laço ---
teste:
	beq $4, $0, sai # Se $4 for igual a 0, sai do laço
	mul $2, $2, $4 # inteiro * (inteiro - 1)
	addi $4, $4, -1 # inteiro - 1
	j teste # Retorna para o início do laco
	# --- Fim do laço ---
sai: 
	jr $31 # Retorna para a linha a baixo de jal
