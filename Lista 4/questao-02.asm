# Faça uma função para verificar se um número é positivo ou negativo. Sendo que o valor de retorno
# será 1 se positivo, -1 se negativo e 0 se for igual a 0.

.text
main:
	# --- ENTRADA DE DADOS ---
	addi $2, $0, 5 
	syscall # Ler um inteiro
	add $4, $0, $2 # Armazena o inteiro no registrador 4
	jal sinal # Chama a função sinal
	
	# --- SAÍDA DE DADOS ---
return:
	add $4, $0, $2 # Armazena no registrador 4 o valor contido no registrador 2
	addi $2, $0, 1 
	syscall # Imprime o valor
	
	# --- ENCERRAMENTO ---
	addi $2, $0, 10
	syscall # Encerra o programa
	
	# --- FUNÇÃO SINAL ---
sinal:
	add $2, $0, $4 # Armazena o valor de entrada no registrador 2
	beq $2, $0, zero # Se o valor for igual a 0, vá para a instrução "zero"
	slt $8, $2, $0 # Verifica se o valor é menor ou maior do que zero. Maior = 0; Menor = 1
	beq $8, $0, maior # Se o valor for maior do que zero, vá para instrução "maior".
menor:
	addi $2, $0, -1 # Armazena o valor -1 no registrador 2
	jr $31 # Retorna para a linha a baixo de jal
maior:
	addi $2, $0, 1 # Armazena o valor 1 no registrador 2
	jr $31 # Retorna para a linha a baixo de jal
zero: 
	addi $2, $0, 0 # Armazena o valor 0 no registrador 2
	jr $31 # Retorna para a linha a baixo de jal
