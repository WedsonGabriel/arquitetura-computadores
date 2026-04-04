# Faça um programa que leia um número inteiro (entre 0 e 9999) e imprima esse número com 4 caracteres,
# sendo o número alinhado à direita.

.text
main:
	# --- ARMAZENAMENTO INICIAL ---
	addi $8, $0, 10 # Armazena o número 10 no registrador 8
	
	# --- LEITURA DE DADOS ---
	addi $2, $0, 5 # Ler o número
	syscall
	add $9, $0, $2 # Armazena o número no registrador 9
	
	# --- PROCESSAMENTO ---
	# Quarto algarismo
	div $9, $8 # Divide o número por 10
	mfhi $10 # Resto da divisão (IMPRIME ESSE)
	mflo $11 # Quociente (DIVIDE ESSE)
	
	# Terceiro algarismo
	div $11, $8 # Divide o quociente por 10
	mfhi $12 # Resto da divisão (IMPRIME ESSE)
	mflo $13 # Quociente (DIVIDE ESSE)
	
	# Segundo algarismo
	div $13, $8 # Divide o quociente por 10
	mfhi $14 # Resto da divisão (IMPRIME ESSE)
	mflo $15 # Quociente (DIVIDE ESSE)
	
	# Primeiro algarismo
	div $15, $8 # Divide o quociente por 10
	mfhi $16 # Resto da divisão (IMPRIME ESSE)
	mflo $17 # Quociente (DIVIDE ESSE)
	
	# --- SAÍDA DE DADOS ---
	addi $4, $0, ' '
	addi $2, $0, 11 # Imprime um espaço em branco
	syscall
	
	add $4, $0, $16
	addi $2, $0, 1 # Imprime o primeiro algarismo
	syscall
	
	add $4, $0, $14
	addi $2, $0, 1 # Imprime o segundo algarismo
	syscall
	
	add $4, $0, $12
	addi $2, $0, 1 # Imprime o terceiro algarismo
	syscall
	
	add $4, $0, $10
	addi $2, $0, 1 # Imprime o quarto algarismo
	syscall
	
	# --- ENCERRAMENTO ---
	addi $2, $0, 10 # Encerra o programa
	syscall
