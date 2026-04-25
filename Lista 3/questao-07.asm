# Faça um programa que leia números inteiros diferentes de zero e calcule a soma dos valores positivos.
# O laço do programa termina quando o usuário digita um valor zero. Em seguida o programa imprime a soma dos
# valores positivos digitados.

.text
main:
	# --- ARMAZENAMENTO DE DADOS ---
	addi $8, $0, 0 # Soma positivos
	addi $9, $0, 0 # Soma negativos
	
	# --- INÍCIO DO LAÇO ---
teste:
	addi $2, $0, 5 # Ler um número inteiro
	syscall
	add $10, $0, $2 # Armazena o número lido no registrador 10
	beq $10, $0, sai
	slt $11, $10, $0 # Se valor digitado < 0, retorna 1. Senão, retorna 0.
	beq $11, $0, maior
	menor: add $9, $9, $10
	j teste
	maior: add $8, $8, $10 
	j teste
	# --- FIM DO LAÇO ---
	
	# --- PROCESSAMENTO ---
sai:
	add $4, $0, $8 # Prepara para imprimir a soma dos positivos
	addi $2, $0, 1 # Imprime a soma dos posivitos
	syscall
	
	# --- ENCERRAMENTO ---
	addi $2, $0, 10 # Encerra o programa
	syscall
