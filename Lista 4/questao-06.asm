# Faça uma função que receba 3 números inteiros como parâmetro, representando horas, minutos e segundos,
# e os converta em segundos.

.text
main:
	# --- ENTRADA DE DADOS ---
	addi $2, $0, 5 # Ler a hora
	syscall
	add $8, $0, $2 # Armazena a hora no registrador 8
	
	addi $2, $0, 5 # Ler os minutos
	syscall
	add $9, $0, $2 # Armazena os minutos no registrador 9
	
	addi $2, $0, 5 # Ler os segundos
	syscall
	add $10, $0, $2 # Armazena os segundos no registrador 10
	
	jal tempo
	
	# --- SAÍDA DE DADOS ---
return:
	add $4, $0, $2 # Armazena no registrador 4, o valor contido no registrador 2
	addi $2, $0, 1 # Imprime o resultado
	syscall
	
	# --- ENCERRAMENTO ---
	addi $2, $0, 10 # Encerra o programa
	syscall
	
	# --- FUNÇÃO TEMPO ---
tempo:
	add $4, $0, $8 # Armazena a hora no registrador 4
	mul $4, $4, 60 # Multiplica o valor da hora por 60 segundos
	mul $4, $4, 60 # Multiplica "valor hora x 60 segundos" por 60 minutos
	
	add $5, $0, $9 # Armazena os minutos no registrador 5
	mul $5, $5, 60 # Multiplica o valor dos minutos por 60 segundos
	
	add $6, $0, $10 # Armazena os segundos no registrador 6
	
	add $2, $4, $5 # Armazena hora + minutos, convertidos em segundos, no registrador 2  
	add $2, $2, $6 # Armazena hora + minutos, convertidos em segundos, + segundos no registrador 2  
	
	jr $31
