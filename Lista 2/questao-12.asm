# Faça um programa que leia as duas notas (entre 0 e 100) e as faltas de um aluno em uma disciplina.
# A média do aluno é calculada ponderadamente, com pesos 2 e 3. A cada 5 faltas o aluno perde 10 pontos.
# O programa deve informar a média, a penalidade e a média final, uma em cada linha.

.text
main:
	# --- ARMAZENAMENTO DE DADOS ---
	addi $8, $0, 2 # Armazena o número 2 no registrador 8
	addi $9, $0, 3 # Armazena o número 3 no registrador 9
	addi $10, $0, 5 # Armazena o número 5 no registrador 10
	
	# --- LEITURA DE DADOS ---
	addi $2, $0, 5 # Ler a primeira nota
	syscall
	add $11, $0, $2 # Armazena a primeira nota no registrador 11
	
	addi $2, $0, 5 # Ler a segunda nota
	syscall
	add $12, $0, $2 # Armazena a segunda nota no registrador 12
	
	addi $2, $0, 5 # Ler o número de faltas
	syscall
	add $13, $0, $2 # Armazena o número de faltas no registrador 13
	
	# --- PROCESSAMENTO ---
	# Cálculo da média ponderada
	mul $14, $11, $8 # Multiplica a primeira nota pelo peso 2
	mul $15, $12, $9 # Multiplica a segunda nota pelo peso 3
	add $16, $14, $15 # Soma a primeira e a segunda nota multiplicadas pelos seus pesos
	add $17, $8, $9 # Soma os pesos
	div $16, $17 # Divide a soma das nota pela soma dos pesos
	mfhi $18 # Resto da divisão
	mflo $19 # Quociente
	
	# Faltas
	div $13, $10 # Divide o total de faltas por 5
	mflo $20 # Quociente
	
	addi $21, $0, 10 # Armazena o valor 10 no registrador 21 (Penalização a cada 5 faltas)
	mul $22, $20, $21 # Multiplica o número de vezes que o aluno atingiu 5 faltas por 10 pontos
	
	sub $23, $19, $22 # Nota - pontuação
	
	# --- SAÍDA DE DADOS ---
	# Média Ponderada
	add $4, $0, $19 
	addi $2, $0, 1 # Imprime a parte inteira da nota (Quociente)
	syscall
	addi $4, $0, ','
	addi $2, $0, 11 # Imprime uma vírgula
	syscall
	add $4, $0, $18
	addi $2, $0, 1 # Imprime a parte fracionária da nota (Resto)
	syscall
	add $4, $0, '\n'
	addi $2, $0, 11 # Imprime uma quebra de linha
	syscall
	
	# Penalidade
	add $4, $0, $22
	addi $2, $0, 1 # Imprime a penalidade
	syscall
	add $4, $0, '\n'
	addi $2, $0, 11 # Imprime uma quebra de linha
	syscall
	
	# Média final
	add $4, $0, $23
	addi $2, $0, 1
	syscall
	addi $4, $0, ','
	addi $2, $0, 11 # Imprime uma vírgula
	syscall
	add $4, $0, $18
	addi $2, $0, 1 # Imprime a parte fracionária da nota (Resto)
	syscall
	
	# --- ENCERRAMENTO ---
	addi $2, $0, 10 # Encerra o programa
	syscall
