# Faça um programa que leia dois números e informe o menor deles (use apenas operações aritméticas e lógicas).

.text
main:
	# --- FÓRMULAS ---
		# (a*0) + (b*1) -> Acha o menor número
		# (a*1) + (b*0) -> Acha o maior número
		# Sinal Positivo (SS)
		# Sinal Negativo (~SS)
	
	
	# --- LEITURA DE DADOS ---
	addi $2, $0, 5 # Ler o primeiro número (a)
	syscall
	add $8, $0, $2 # Armazena o primeiro número no registrador 8
	
	addi $2, $0, 5 # Ler o segundo número (b)
	syscall
	add $9, $0, $2 # Armazena o segundo número no registrador 9
	
	# --- PROCESSAMENTO ---
	sub $10, $8, $9 # a - b = SS
	not $11, $10 # Nega o resultado de "a-b". Assim, a - b = ~SS
	
	srl $12, $10, 31 # Desloca 31 casas para a direita
	srl $13, $11, 31 # Desloca 31 casas para a direita
	
	mul $14, $8, $12 # a * 0
	mul $15, $9, $13 # b * 1
	
	add $16, $14, $15 # (a*0) + (b*1)
	add $4, $0, $16 # Armazena o resultado no registrador 4
	
	# --- SAÍDA DE DADOS ---
	addi $2, $0, 1 # Imprime o resultado
	syscall
	
	# --- ENCERRAMENTO DO PROGRAMA ---
	addi $2, $0, 10
	syscall
