# Faça um programa que leia um caractere minúsculo e imprima o seu equivalente maiúsculo.

.text
main:
	# --- ARMAZENAMENTO INICIAL
	addi $8, $0, 32 # qualquer caractere minúsculo subtraído por 32 resultará no seu maiúsculo. (tabela ASCII)
	
	# --- LEITURA DE DADOS ---
	addi $2, $0, 12 # Ler um caractere
	syscall
	add $9, $0, $2 # Armazena o caractere no registrador 9
	
	# --- PROCESSAMENTO ---
	sub $10, $9, $8 # Subtrai o caractere minúsculo por 32, resultando no seu maiúsculo
	
	# --- SAÍDA DE DADOS
	addi $4, $0, '\n'
	addi $2, $0, 11 # Imprime uma quebra de linha
	syscall
	
	add $4, $0, $10
	addi $2, $0, 11 # Imprime o caractere maiúsculo
	syscall
	
	# --- ENCERRA O PROGRAMA ---
	addi $2, $0, 10
	syscall
