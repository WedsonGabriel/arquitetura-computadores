# Faça um programa que leia dois números inteiros (entre 0 e 9999) e imprima esses números, um após o outro,
# separados por vírgula, cada um com 4 caracteres, sendo cada número alinhado à direita.

.text
main:
	# --- ARMAZENAMENTO INICIAL ---
	addi $8, $0, 10 # Armazena o número 10 no registrador 8
	
	# --- LEITURA DE DADOS ---
	addi $2, $0, 5 # Ler o primeiro número
	syscall
	add $9, $0, $2 # Armazena o primeiro número no registrador 9
	
	addi $2, $0, 5 # Ler o segundo número
	syscall
	add $10, $0, $2 # Armazena o segundo número no registrador 10
	
	
	
	# --- PROCESSAMENTO DO PRIMEIRO NÚMERO ---
	# Quarto Algarismo
	div $9, $8 # Divide o primeiro número por 10
	mfhi $11 # Resto da divisão (IMPRIME ESSE)
	mflo $12 # Quociente (DIVIDE ESSE)
	
	# Terceiro Algarismo
	div $12, $8 # Divide o primeiro número por 10
	mfhi $13 # Resto da divisão (IMPRIME ESSE)
	mflo $14 # Quociente (DIVIDE ESSE)
	
	# Segundo Algarismo
	div $14, $8 # Divide o primeiro número por 10
	mfhi $15 # Resto da divisão (IMPRIME ESSE)
	mflo $16 # Quociente (DIVIDE ESSE)
	
	# Primeiro Algarismo
	div $16, $8 # Divide o primeiro número por 10
	mfhi $17 # Resto da divisão (IMPRIME ESSE)
	mflo $18 # Quociente (DIVIDE ESSE)
	
	# --- SAÍDA DO PRIMEIRO NÚMERO ---
	addi $4, $0, ' '
	addi $2, $0, 11 # Imprime um espaço em branco
	syscall
	
	add $4, $0, $17
	addi $2, $0, 1 # Imprime o primeiro algarismo
	syscall
	
	add $4, $0, $15
	addi $2, $0, 1 # Imprime o segundo algarismo
	syscall
	
	add $4, $0, $13
	addi $2, $0, 1 # Imprime o terceiro algarismo
	syscall
	
	add $4, $0, $11
	addi $2, $0, 1 # Imprime o quarto algarismo
	syscall
	
	addi $4, $0, ','
	addi $2, $0, 11 # Imprime uma vírgula
	syscall
	
	
	
	# --- PROCESSAMENTO DO SEGUNDO NÚMERO ---
	# Quarto Algarismo
	div $10, $8 # Divide o primeiro número por 10
	mfhi $11 # Resto da divisão (IMPRIME ESSE)
	mflo $12 # Quociente (DIVIDE ESSE)
	
	# Terceiro Algarismo
	div $12, $8 # Divide o primeiro número por 10
	mfhi $13 # Resto da divisão (IMPRIME ESSE)
	mflo $14 # Quociente (DIVIDE ESSE)
	
	# Segundo Algarismo
	div $14, $8 # Divide o primeiro número por 10
	mfhi $15 # Resto da divisão (IMPRIME ESSE)
	mflo $16 # Quociente (DIVIDE ESSE)
	
	# Primeiro Algarismo
	div $16, $8 # Divide o primeiro número por 10
	mfhi $17 # Resto da divisão (IMPRIME ESSE)
	mflo $18 # Quociente (DIVIDE ESSE)
	
	# --- SAÍDA DO SEGUNDO NÚMERO ---
	addi $4, $0, ' '
	addi $2, $0, 11 # Imprime um espaço em branco
	syscall
	
	add $4, $0, $17
	addi $2, $0, 1 # Imprime o primeiro algarismo
	syscall
	
	add $4, $0, $15
	addi $2, $0, 1 # Imprime o segundo algarismo
	syscall
	
	add $4, $0, $13
	addi $2, $0, 1 # Imprime o terceiro algarismo
	syscall
	
	add $4, $0, $11
	addi $2, $0, 1 # Imprime o quarto algarismo
	syscall
	
	# --- ENCERRAMENTO ---
	addi $2, $0, 10 # Encerra o programa
	syscall
