# Faça um programa que solicite ao usuário um número para ser a referência e outro para ser a quantidade de
# valores a ser impresso no caso do programa da Q1. Para a mesma resposta, por exemplo, o usuário forneceria
# a referência 3 e a quantidade 10.

.text
main:
	# --- ARMAZENAMENTO DE DADOS ---
	addi $8, $0, 0 # Adiciona o valor 0 ao registrador 8
	addi $9, $0, 0 # i = 0
	
	# --- LEITURA DE DADOS ---
	addi $2, $0, 5 # Solicita o número de referência
	syscall
	add $10, $0, $2 # Armazena o número de referência no registrador 10
	
	addi $2, $0, 5 # Solicita a quantidade de números
	syscall
	add $11, $0, $2 # Armazena a quantidade de números no registrador 11
	
	
	
	# --- INÍCIO DO LAÇO ---
teste: 
	addi $9, $9, 1 # i = i + 1
	add $8, $8, $10 # Soma o valor de referência ao registrador 8
	add $4, $0, $8
	addi $2, $0, 1 # Imprime o primeiro múltiplo
	syscall
	addi $4, $0, '\n'
	addi $2, $0, 11 # Imprime uma quebra de linha
	syscall
	slt $12, $9, $11 # Se i < tamanho, retorna 1. Se não, retorna 0.
	bne $12, $0, teste # Se i < tamanho, retorna para o laço. Se não, pula fora
	# --- FIM DO LAÇO ---
	
	# --- ENCERRAMENTO ---
sai:
	addi $2, $0, 10 # Encerra o programa
	syscall
