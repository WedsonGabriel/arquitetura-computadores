# Elabore uma função que receba três notas de um aluno como parâmetros e uma letra.
# Se a letra for A, a função deverá calcular a média aritmética das notas do aluno; se for
# P, deverá calcular a média ponderada, com pesos 5, 3 e 2.

# Observação: As letras devem ser digitadas maiúsculas para o código funcionar corretamente

.text
main:
	# --- ENTRADA DE DADOS ---
	addi $2, $0, 5 # Ler a nota 1
	syscall
	add $8, $0, $2 # Armazena a nota 1 no registrador 8
	
	addi $2, $0, 5 # Ler a nota 2
	syscall
	add $9, $0, $2 # Armazena a nota 2 no registrador 9
	
	addi $2, $0, 5 # Ler a nota 3
	syscall
	add $10, $0, $2 # Armazena a nota 3 no registrador 10
	
	addi $2, $0, 12 # Ler a letra
	syscall
	add $11, $0, $2 # Armazena a letra no registrador 11
	
	addi $4, $0, '\n' # Armazena uma quebra de linha no registrador 4
	addi $2, $0, 11 # Imprime uma quebra de linha
	syscall
	
	jal media # Solicita a função para calcular a média
	
	# --- SAÍDA DE DADOS ---
return:
	add $4, $0, $2 # Armazena o valor contido no registrador 2 no registrador 4
	addi $2, $0, 1 # Imprime a parte inteira da média
	syscall
	addi $4, $0, ',' # Armazena uma vírgula ao registrador 4
	addi $2, $0, 11 # Imprime uma vírgula
	syscall
	add $4, $0, $3 # Armazena o valor contido no registrador 3 no registrador 4
	addi $2, $0, 1 # Imprime a parte fracionária da média
	syscall
	
	# --- ENCERRAMENTO ---
	addi $2, $0, 10 # Encerra o programa
	syscall
	
	# --- FUNÇÃO MÉDIA ---
media:
	# Parâmetros
	add $4, $0, $8 # Adiciona a nota 1 no registrador 4
	add $5, $0, $9 # Adiciona a nota 2 no registrador 5
	add $6, $0, $10 # Adiciona a nota 3 no registrador 6

	# Peso
	addi $12, $0, 5 # Soma o peso 5 ao registrador 7
	addi $12, $12, 3 # Soma 5+3 ao registrador 7
	addi $12, $12, 2 # Soma (5+3) + 2 ao registrador 7
	addi $13, $0, 3 # Armazena o valor 3 no registrador 13
	
	# Verificação da letra
	beq $11, 'P', ponderada

# A
aritmetica: 
	add $2, $4, $5 # Soma nota 1 + nota 2
	add $2, $2, $6 # soma (nota 1 + nota 2) + nota 3
	
	div $2, $13 # Divide a soma das notas por 3
	mflo $2 # Quociente (Parte inteira)
	mfhi $3 # Resto de divisão (Parte fracionária)
	
	jr $31 # Retorna para a linha a baixo do jal

# P
ponderada:
	mul $13, $4, 5 # Nota 1 x Peso 5
	mul $14, $5, 3 # Nota 2 x Peso 3
	mul $15, $6, 2 # Nota 3 x Peso 2
	
	add $16, $13, $14 # Soma da nota 1 + nota 2, multiplicadas pelos pesos
	add $16, $16, $15 # Soma da nota 1 + nota 2 + nota 3, multiplicadas pelos pesos
	
	div $16, $12 # (Soma das Notas x Peso) / Soma dos pesos
	mflo $2 # Quociente (Parte inteira)
	mfhi $3 # Resto da divisão (Parte fracionária)
	
	jr $31 # Retorna para a linha a baixo do jal
