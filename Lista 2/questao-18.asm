# Faça um programa que receba um inteiro (entre 0 e 999) e imprima o binário correspondente.

.text
main:
	# --- ARMAZENAMENTO INICIAL ---
	addi $8, $0, 2 # Armazena o número 2 no registrador 8
	
	# --- LEITURA DE DADOS ---
	addi $2, $0, 5 # Ler um inteiro
	syscall
	add $9, $0, $2 # Armazena o inteiro no registrador 9
	
	# --- PROCESSAMENTO ---
	div $9, $8 # Inteiro / 2
	mfhi $10 # Resto de divisão (décimo bit)
	mflo $11 # Quociente
	
	div $11, $8 # Inteiro / 2
	mfhi $12 # Resto de divisão (nono bit)
	mflo $11 # Quociente
	
	div $11, $8 # Inteiro / 2
	mfhi $13 # Resto de divisão (oitavo bit)
	mflo $11 # Quociente
	
	div $11, $8 # Inteiro / 2
	mfhi $14 # Resto de divisão (sétimo bit)
	mflo $11 # Quociente
	
	div $11, $8 # Inteiro / 2
	mfhi $15 # Resto de divisão (sexto bit)
	mflo $11 # Quociente
	
	div $11, $8 # Inteiro / 2
	mfhi $16 # Resto de divisão (quinto bit)
	mflo $11 # Quociente
	
	div $11, $8 # Inteiro / 2
	mfhi $17 # Resto de divisão (quarto bit)
	mflo $11 # Quociente
	
	div $11, $8 # Inteiro / 2
	mfhi $18 # Resto de divisão (terceiro bit)
	mflo $11 # Quociente
	
	div $11, $8 # Inteiro / 2
	mfhi $19 # Resto de divisão (segundo bit)
	mflo $11 # Quociente
	
	div $11, $8 # Inteiro / 2
	mfhi $20 # Resto de divisão (primeiro bit)
	mflo $11 # Quociente
	
	# --- SAÍDA DE DADOS ---
	add $4, $0, $20
	addi $2, $0, 1 # Imprime o primeiro bit
	syscall
	
	add $4, $0, $19
	addi $2, $0, 1 # Imprime o segundo bit
	syscall
	
	add $4, $0, $18
	addi $2, $0, 1 # Imprime o terceiro bit
	syscall
	
	add $4, $0, $17
	addi $2, $0, 1 # Imprime o quarto bit
	syscall
	
	add $4, $0, $16
	addi $2, $0, 1 # Imprime o quinto bit
	syscall
	
	add $4, $0, $15
	addi $2, $0, 1 # Imprime o sexto bit
	syscall
	
	add $4, $0, $14
	addi $2, $0, 1 # Imprime o sétimo bit
	syscall
	
	add $4, $0, $13
	addi $2, $0, 1 # Imprime o oitavo bit
	syscall
	
	add $4, $0, $12
	addi $2, $0, 1 # Imprime o nono bit
	syscall
	
	add $4, $0, $10
	addi $2, $0, 1 # Imprime o décimo bit
	syscall
	
	# --- ENCERRAMENTO ---
	addi $2, $0, 10 # Encerra o programa
	syscall
