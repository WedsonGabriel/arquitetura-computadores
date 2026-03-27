# Escreva um programa para ler dois números inteiros e mostrar na tela o maior deles, bem como a diferença
# entre eles (a diferença é sempre um valor positivo)

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
	slt $10, $8, $9 # Verifica se $8 < $9. 
	beq $10, $0, OptionMaior1 # $10 = 1 ($8 é Menor); $10 = 0 ($8 é Maior)
	
OptionMaior2:
	add $4, $0, $9 # Se o valor contido em $8 não for o maior, então o maior será o valor contido em $9
	addi $2, $0, 1 # Imprime o maior
	syscall
	addi $4, $0, '\n' 
	addi $2, $0, 11 # Imprime uma quebra de linha
	syscall
	j diferenca2
	
OptionMaior1:
	add $4, $0, $8 # Se o valor contido em $8 for o maior, logo ele será imprimido
	addi $2, $0, 1 # Imprime o maior
	syscall
	addi $4, $0, '\n' 
	addi $2, $0, 11 # Imprime uma quebra de linha
	syscall
	
diferenca1:
	sub $4, $8, $9 # Calcula a diferença entre os valores contidos em $8 e $9, respectivamente
	addi $2, $0, 1 # Imprime a diferença
	syscall
	j end
	
diferenca2:
	sub $4, $9, $8 # Calcula a diferença entre os valores contidos em $9 e $8, respectivamente
	addi $2, $0, 1 # Imprime a diferença
	syscall
	
	# --- ENCERRAMENTO ---
end:
	addi $2, $0, 10
	syscall
