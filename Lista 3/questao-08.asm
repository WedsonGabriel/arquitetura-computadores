# Faça um programa que leia números inteiros diferentes de zero e encontre o menor valor digitado e o maior
# valor digitado. O programa informa o maior e o menor, um em cada linha, quando o usuário digitar um 0.

.text
main:
	# --- ARMAZENAMENTO DE DADOS ---
	addi $8, $0, 0 # Armazena o menor
	addi $9, $0, 0 # Armazena o maior
	
	# --- INICIALIZAÇÃO ---
	addi $2, $0, 5 # Ler um número inteiro
	syscall
	add $10, $0, $2 # Armazena o número inteiro no registrador 10
	
	beq $10, $0, encerra # Se o primeiro número digitado já for 0, o programa encerra
	
	add $8, $0, $10 # Atualiza o menor valor
	add $9, $0, $10 # Atualiza o maior valor
	
	# --- INÍCIO DO LAÇO ---
teste:
	addi $2, $0, 5 # Ler o próximo número inteiro
	syscall
	add $10, $0, $2 # Armazena o número inteiro no registrador 10
	beq $10, $0, sai # Quando o número digitado for igual a 0, sai do laço
	
verificaMenor:
	slt $11, $10, $8 # Se $10 < $8, retorna 1. Senão, retorna 0
	bne $11, $0, menor # Verifica se o número contido em $11 é 1.
	j verificaMaior
	menor: add $8, $0, $10 # Armazena o menor número
	
verificaMaior:
	slt $12, $10, $9 # Se $10 < $9, retorna 1. Senão, retorna 0
	beq $12, $0, maior # Verifica se o número contido em $11 é 0.
	j teste
	maior: add $9, $0, $10 # Armazena o maior número
	j teste # Retorna para o início do laço
	# --- FIM DO LAÇO ---
	
	# --- PROCESSAMENTO ---
sai:
	add $4, $0, $9 # Prepara para imprimir o maior número
	addi $2, $0, 1 # Imprime o maior número
	syscall
	addi $4, $0, '\n' # Prepara para imprimir uma quebra de linha
	addi $2, $0, 11 # Imprime uma quebra de linha
	syscall
	add $4, $0, $8 # Prepara para imprimir o menor número
	addi $2, $0, 1 # Imprime o menor número
	syscall
	
	# --- ENCERRAMENTO ---
encerra:
	addi $2, $0, 10 # Encerra o programa
	syscall
