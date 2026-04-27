# Crie uma função que recebe como parâmetro um número inteiro e devolve o seu dobro.

.text
main:
	# --- ENTRADA DE DADOS ---
	addi $2, $0, 5 # Ler um inteiro
	syscall
	add $4, $0, $2 # Armazena o inteiro no registrador 4
	jal dobro # Chama a função
	
	# --- SAÍDA DE DADOS ---
return:
	add $4, $0, $2 # Armazena no registrador 4, o valor contido no registrador 2 
	addi $2, $0, 1 # Imprime o resultado
	syscall
	
	# --- ENCERRAMENTO ---
	addi $2, $0, 10 # Encerra o programa
	syscall
	
	# --- FUNÇÃO DOBRO ---
dobro: 	
	add $2, $0, $4 # Armazena a entrada ($4) no registrador 2
	mul $2, $2, 2 # Multiplica por 2 o conteúdo que tá no registrador 2 e armazena no registrador 2
	jr $31 # Retorna para a linha a baixo de jal