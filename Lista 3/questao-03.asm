# Faça um programa que implementa um laço com um teste no início que conte de 0 a 10 imprimindo esses
# números, um em cada linha da saída.

.text
main:
	# --- ARMAZENAMENTO DE DADOS ---
	addi $8, $0, 0 # Armazena o valor 0 no registrador 8
	addi $9, $0, 0 # Armazena o valor 0 no registrador 9 (i = 0)
	addi $10, $0, 10 # Adiciona 10 no registrador 10 
	
	# --- IMPRIME ZERO ---
	add $4, $0, $9
	addi $2, $0, 1 # Imprime 0
	syscall
	addi $4, $0, '\n' 
	addi $2, $0, 11 # Imprime uma quebra linha
	syscall
	
	# --- INÍCIO DO LAÇO ---
teste:
	beq $9, $10, sai # Verifica se i é igual a 10. Se sim, sai fora
	addi $9, $9, 1 # i = i + 1
	add $4, $0, $9
	addi $2, $0, 1 # Imprime uma unidade
	syscall
	addi $4, $0, '\n'
	addi $2, $0, 11 # Imprime uma quebra de linha
	syscall
	slt $11, $9, $10 # Se i < 11, retorna 1. Se não, retorna 0.
	j teste
	# --- FIM DO LAÇO ---
	
	# --- ENCERRAMENTO ---
sai:
	addi $2, $0, 10 # Encerra o programa
	syscall
