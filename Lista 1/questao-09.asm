# Faça um programa que leia um número inteiro, representando a duração em segundos
# de um experimento científico e imprima o tempo decorrido nesse experimento no formato h:m:s.
# Exemplo: 3755 gera uma saída 1:2:35

.text
main:
	# --- BASE HORAS E MINUTOS ---
	addi $8, $0, 60 # Quantidade de segundos de 1 minuto
	addi $9, $0, 3600  # Quantidade de segundos de 1 hora
	addi $10, $0, ':' # Armazena o : no registrador 10
	
	# --- LEITURA DE DADOS ---
	addi $2, $0, 5 # Ler um inteiro
	syscall
	add $11, $0, $2 # Armazena o inteiro no registrador 11
	
	# --- PROCESSAMENTO ---
	div $11, $9 # Divide o tempo dado em segundos por 3600 (Transforma em horas)
	mfhi $12 # Resto_horas
	mflo $13 # Horas
	
	div $12, $8 # Resto_horas dividido por 60 (Transforma em minutos)
	mfhi $14 # Segundos (Resto da divisão "Resto_horas % 60")
	mflo $15 # Minutos (Quociente da divisão "Resto_horas // 60")
	
	# --- SAÍDA DE DADOS ---
	add $4, $0, $13
	addi $2, $0, 1 # Imprime as horas
	syscall
	add $4, $0, $10 
	addi $2, $0, 11 # Imprime o :
	syscall 
	
	add $4, $0, $15
	addi $2, $0, 1 # Imprime os minutos
	syscall
	add $4, $0, $10 
	addi $2, $0, 11 # Imprime o :
	syscall 
	
	add $4, $0, $14
	addi $2, $0, 1 # Imprime os segundos
	syscall
	
	# --- ENCERRA O PROGRAMA ---
	addi $2, $0, 10
	syscall
