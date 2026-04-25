# Faça um programa que leia números inteiros e calcule a soma. O laço do programa termina quando o usuário
# digita um valor negativo. Em seguida o programa imprime a soma dos valores digitados.

.text
main:
	# --- ARMAZENAMENTO DE DADOS ---
	addi $8, $0, 0 # Registrador de soma
	addi $9, $0, 0 # Referência 0
	
	
teste:
	# --- INÍCIO DO LAÇO ---
	addi $2, $0, 5 # Ler um número inteiro
	syscall
	add $10, $0, $2 # Armazena o número inteiro no registrador 10
	slt $11, $10, $9 # Valor digitado < 0? Se sim $11 será igual a 1. Senão, $11 será igual a 0.
	bne $11, $0, sai # Se $11 for diferente de 0, significa que ele é um número negativo. Sai do laço
	add $8, $8, $10 # Soma o novo número digitado ao número anterior, caso ele não seja negativo
	j teste
	# --- FIM DO LAÇO ---
	
	# --- PROCESSAMENTO ---
sai:
	add $4, $0, $8 # Prepara para imprimir a soma dos números inteiros positivos
	addi $2, $0, 1 # Imprime a soma dos números inteiros positivos
	syscall
	
	# --- ENCERRAMENTO ---
	addi $2, $0, 10 # Encerra o programa
	syscall
