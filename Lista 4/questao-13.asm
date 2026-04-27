# Faça uma função que receba dois valores numéricos e um símbolo. Este símbolo representará a operação
# que se deseja efetuar com os números. Se o símbolo for + deverá ser realizada uma adição,
# se for − uma subtração, se for / uma divisão e se for ∗ será efetuada uma multiplicação.

# Observação: Se o sinal for inválido, o programa imprime 'E'

.text
main:
	# --- ENTRADA DE DADOS ---
	addi $2, $0, 5 # Ler o primeiro número
	syscall
	add $8, $0, $2 # Armazena o primeiro número no registrador 8
	
	addi $2, $0, 5 # Ler o segundo número
	syscall
	add $9, $0, $2 # Armazena o segundo número no registrador 9
	
	addi $2, $0, 12 # Ler um símbolo 
	syscall
	add $10, $0, $2 # Armazena o símbolo no registrador 10
	
	addi $4, $0, '\n' # Armazena uma quebra de linha no registrador 4
	addi $2, $0, 11 # Imprime uma quebra de linha
	syscall
	
	jal operation # Chama a função para realizar a operação
	
	# --- SAÍDA DE DADOS ---
return:
	add $4, $0, $2 # Armazena o valor contido em $2 no registrador 4
	beq $2, 'E', printE # Verifica se $2 armazena 'E'. Se sim, vai para a instrução 'PrintE'
	addi $2, $0, 1 # Imprime o resultado da operação
	syscall
printE:
	addi $2, $0, 11 # Imprime 'E'
	syscall
	
	# --- ENCERRAMENTO ---
	addi $2, $0, 10 # Encerra o programa
	syscall
	
	# --- FUNÇÃO Operation ---
operation:
	beq $10, '+', soma # Verifica se o sinal digitado é igual a '+'
	beq $10, '-', subtracao # Verifica se o sinal digitado é igual a '-'
	beq $10, '*' multiplicacao # Verifica se o sinal digitado é igual a '*'
	beq $10, '/' divisao # Verifica se o sinal digitado é igual a '/'
	j sinalInvalido # Se o sinal não for nenhum dos anteriores, vai para instrução 'sinalInvalido'

soma: 
	add $2, $8, $9 # Soma os dois números ($8 + $9)
	jr $31 # Retorna para a linha a baixo de jal
	
subtracao:
	sub $2, $8, $9 # Subtrai os dois números ($8 - $9)
	jr $31 # Retorna para a linha a baixo de jal
	
multiplicacao:
	mul $2, $8, $9 # Multiplica os dois números ($8 * $9)
	jr $31 # Retorna para a linha a baixo de jal
	
divisao:
	div $8, $9 # Divide $8 por $9 ($8 / $9)
	mflo $2 # Quociente (Parte inteira)
	jr $31 # Retorna para a linha a baixo de jal
	
sinalInvalido:
	addi $2, $0, 'E' # Armazena a letra 'E' no registrador 2
	jr $31 # Retorna para a linha a baixo de jal
