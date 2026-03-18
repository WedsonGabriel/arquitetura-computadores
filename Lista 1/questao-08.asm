# Faça um programa que leia três números inteiros, representando a duração em horas, minutos e segundos 
# de um experimento científico e informe essa duração em segundos.

.text
main:
	# --- BASE NUMÉRICA ---
	addi $8, $0, 10
	
	# --- LEITURA DE DADOS ---
	addi $2, $0, 5 # Ler um inteiro
	syscall
	add $9, $0, $2 # Armazena a hora
	
	addi $2, $0, 5 # Ler um inteiro
	syscall
	add $10, $0, $2 # Armazena o minuto
	
	addi $2, $0, 5 # Ler um inteiro
	syscall
	add $11, $0, $2 # Armazena os segundos
	
	addi $12, $0, ':' #Adiciona o : no registrador 12
	
	# --- DURAÇÃO EM SEGUNDOS ---
	addi $13, $0, 60 # Duração de 1 minuto em segundos
	addi $14, $0, 3600 # Duração de 1 hora em segundos
	
	mul $15, $9, $14 # Multiplica a hora pela a quantidade de segundos em 1 hora (3600)
	mul $16, $10, $13 # Multiplica os minutos pela quantidade de segundos em 1 minuto (60)
	add $17, $15, $16 # Soma os segundos das horas com os segundos dos minutos
	add $18, $17, $11 # Soma os segundos de hora+minutos com os segundos
	
	# --- SAÍDA DE DADOS ---
	addi $19, $0, '\n'
	
	add $4, $0, $9 
	addi $2, $0, 1 # Imprime a hora
	syscall
	add $4, $0, $12
	addi $2, $0, 11 # Imprime o :
	syscall
	
	add $4, $0, $10 
	addi $2, $0, 1 # Imprime os minutos
	syscall
	add $4, $0, $12
	addi $2, $0, 11 # Imprime o :
	syscall
	
	add $4, $0, $11 
	addi $2, $0, 1 # Imprime os segundos
	syscall
	add $4, $0, $19
	addi $2, $0, 11 # Quebra uma linha
	syscall
	
	add $4, $0, $18
	addi $2, $0, 1 # Imprime a duração em segundos
	syscall
	
	# --- ENCERRA O PROGRAMA ---
	addi $2, $0, 10
	syscall
