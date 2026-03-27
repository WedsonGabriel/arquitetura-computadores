# Faça um programa para ler um número inteiro. Se o número for positivo, imprima o dobro do número, 
# se for negativo, imprima o quadrado do número.

.text
main:
	# --- ARMAZENAMENTO DE DADOS ---
	addi $8, $0, 2 # Armazena o valor 2 no registrador 8
	
	# --- LEITURA DE DADOS ---
	addi $2, $0, 5 # Ler um inteiro
	syscall
	add $9, $0, $2 # Armazena o inteiro no registrador 9
	
	# --- PROCESSAMENTO ---
	srl $10, $9, 31 # Verifica o sinal do número contido no $9
	bne $10, $0, negativo # Verifica se o sinal é diferente de 0. Se sim, o número é negativo.
	
positivo:
	mul $11, $9, $8 # Inteiro * 2
	add $4, $0, $11
	j print
	
negativo: 
	mul $11, $9, $9 # Inteiro * Inteiro
	add $4, $0, $11
	
	# --- SAÍDA DE DADOS ---
print:
	addi $2, $0, 1 # Imprime o resultado
	syscall
	
	# --- ENCERRAMENTO ---
	addi $2, $0, 10
	syscall
