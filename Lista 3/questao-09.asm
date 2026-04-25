# Faça um programa leia certa quantidade de números e imprima o maior deles e quantas vezes o maior
# número foi lido. A quantidade de números a serem lidos deve ser fornecido pelo usuário.

.text
main:
	# --- ARMAZENAMENTO INICIAL ---
	addi $8, $0, 0 # Armazena o maior
	addi $9, $0, 0 # i = 0 (contador geral)
	addi $10, $0, 0 # j = 0 (Contador do maior)
	
	# --- ENTRADA DE DADOS ---
	addi $2, $0, 5 # Solicita a quantidade de números a serem lidos
	syscall
	add $11, $0, $2 # Armazena a quantidade no registrador 11
	
	# --- INÍCIO DO LAÇO ---
teste:
	beq $9, $11, sai # Se i = quantidade limite, o laço para
	addi $2, $0, 5 # Ler um número inteiro
	syscall
	add $12, $0, $2 # Armazena o número inteiro no registrador 12
	addi $9, $9, 1 # i = i + 1
	
	slt $13, $12, $8 # Se $11 < $8, retorna 1. Senão, retorna 0.
	beq $13, $0, maior # Se for igual a 0 (maior), vira o maior número lido
	j teste
maior: 
	add $8, $0, $12
	addi $10, $10, 1
	j teste
	# --- FIM DO LAÇO ---
	
	# --- PROCESSAMENTO ---
sai:
	add $4, $0, $8 # Prepara para imprimir o maior número
	addi $2, $0, 1 # Imprime o maior número
	syscall
	add $4, $0, '\n' # Prepara para imprimir uma quebra de linha
	addi $2, $0, 11 # Imprime uma quebra de linha
	syscall
	add $4, $0, $10 # Prepara para imprimir quantas vezes o maior foi lido
	addi $2, $0, 1 # Imprime quantas vezes o maior foi lido
	syscall
	
	# --- ENCERRAMENTO ---
	addi $2, $0, 10 # Encerra o programa
	syscall
