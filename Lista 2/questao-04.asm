# Faça um programa que leia dois números e escreva a relação de grandeza entre eles.
# Ex. 345 e 23 gera a saída 345>23. Ex.: 24 e 38 gera a saída 24<38. Ex.: 12 e 12 gera a saída 12=12

.text
main:
	# --- LEITURA DE DADOS ---
	addi $2, $0, 5 # Ler o primeiro número
	syscall
	add $8, $0, $2 # Armazena o primeiro número no registrador 8
	
	addi $2, $0, 5 # Ler o segundo número
	syscall
	add $9, $0, $2 # Armazena o segundo número no registrador 9
	
	# --- PROCESSAMENTO + IMPRESSÃO ---
	beq $8, $9, iguais # Verifica se os valores contidos em $8 e $9 são iguais
	slt $10, $8, $9 # Verifica se o valor contido em $8 é menor do que o valor contido em $9.
	beq $10, $0, maior # Se o valor contido em $10 for igual a 0, então o valor contido em $8 é maior
	
menor:
	add $4, $0, $8 
	addi $2, $0, 1 # Imprime o valor de $8
	syscall
	addi $4, $0, '<'
	addi $2, $0, 11 # Imprime o sinal de <
	syscall
	add $4, $0, $9
	addi $2, $0, 1 # Imprime o valor de $9
	syscall
	j end
	
maior: 
	add $4, $0, $8 
	addi $2, $0, 1 # Imprime o valor de $8
	syscall
	addi $4, $0, '>'
	addi $2, $0, 11 # Imprime o sinal de >
	syscall
	add $4, $0, $9
	addi $2, $0, 1 # Imprime o valor de $9
	syscall
	j end
	
iguais:
	add $4, $0, $8 
	addi $2, $0, 1 # Imprime o valor de $8
	syscall
	addi $4, $0, '='
	addi $2, $0, 11 # Imprime o sinal de =
	syscall
	add $4, $0, $9
	addi $2, $0, 1 # Imprime o valor de $9
	syscall
	j end
	
	# --- ENCERRAMENTO ---
end:
	addi $2, $0, 10
	syscall
