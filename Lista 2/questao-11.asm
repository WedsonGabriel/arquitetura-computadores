# Um pico em uma onda mecânica é caracterizado por três valores de magnitude - a, b e c, tais que (a<b e b>c)
# forma um pico positivo ou (a>b e b<c) forma um pico negativo.
# Faça um programa que leia 3 números e indique se formam um pico, imprimindo a letra P, caso formem. 
# Além disso o código deve informar se o pico é positivo negativo, acrescentando um sinal de + ou de – após
# a letra P. Se os três pontos não formarem um pico, deve ser impressa a letra N.

.text
main:
 	# --- LEITURA DE DADOS ---
 	addi $2, $0, 5 # Ler o primeiro valor (Esquerda)
 	syscall
 	add $8, $0, $2 # Armazena o primeiro valor no registrador 8
 	
 	addi $2, $0, 5 # Ler o segundo valor (Centro)
 	syscall
 	add $9, $0, $2 # Armazena o segundo valor no registrador 9
 	
 	addi $2, $0, 5 # Ler o terceiro valor (Direita)
 	syscall
 	add $10, $0, $2 # Armazena o terceiro valor no registrador 10
 	
 	# --- PROCESSAMENTO ---
 	# Verificando se é linear
 	beq $8, $9, nao_forma_pico
 	beq $9, $10, nao_forma_pico
 	
 	# Verificando o pico central
 	slt $11, $9, $8 # Verifica se $9 (Centro) é menor ou maior do que $8 (Esquerda)
 	slt $12, $9, $10 # Verifica se $9 (Centro) é menor pu maior do que $10 (Direita)
	beq $11, $12, forma_pico # Se os valores forem iguais, forma um pico
	
nao_forma_pico:
	j end
	
forma_pico:
	addi $4, $0, 'P' 
	addi $2, $0, 11 # Imprime a letra P, caso forme um pico
	syscall
	beq $11, $0, positivo # Verifica se o valor central é maior (0) ou menor (1) aos demais.

negativo:
	addi $4, $0, '-'
	addi $2, $0, 11 # Imprime o sinal de -, se o pico for negativo
	syscall
	j end

positivo:
	addi $4, $0, '+'
	addi $2, $0, 11 # Imprime o sinal de +, se o pico for positivo
	syscall
	
	# --- ENCERRAMENTO ---
end:
	addi $2, $0, 10 # Encerra o programa
	syscall
