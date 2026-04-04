# Faça um programa que leia um ano e informe se esse ano é bissexto.

.text
main:
	# --- ARMAZENAMENTO DE DADOS ---
	addi $8, $0, 4 # Armazena o número 4 no registrador 8
	
	# --- LEITURA DE DADOS ---
	addi $2, $0, 5 # Ler o ano
	syscall
	add $9, $0, $2 # Armazena o ano no $9
	
	# --- PROCESSAMENTO ---
	div $9, $8 # Divide o ano por 4
	mfhi $10 # Armazena o resto da divisão no $10
	beq $10, $0, Bissexto # Verifica se o resto da divisão é igual a zero. Se sim, é um ano bissexto.
	
	# --- SAÍDA DE DADOS ---
Nao_bissexto:
	addi $4, $0, 'N'
	addi $2, $0, 11 # Imprime N, pois não é um ano bissexto
	syscall
	j end
	
Bissexto:
	addi $4, $0, 'S'
	addi $2, $0, 11 # Imrime S, pois é um ano bissexto
	syscall
	
	# --- ENCERRAMENTO ---
end:
	addi $2, $0, 10 # Encerra o programa
	syscall
