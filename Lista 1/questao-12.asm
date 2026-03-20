# Faça um programa que calcule uma média ponderada de três números inteiros, com pesos 3, 9 e 15,
# sem usar a operação de multiplicação.

.text
main:
	# --- LEITURA DE DADOS ---
	addi $2, $0, 5 # Ler a primeira nota
	syscall
	add $8, $0, $2 # Armazena a primeira nota no $8
	
	addi $2, $0, 5 # Ler a segunda nota
	syscall
	add $9, $0, $2 # Armazena a segunda nota no $9
	
	addi $2, $0, 5 # Ler a terceira nota
	syscall
	add $10, $0, $2 # Armazena a terceira nota no $10
	
	# --- PROCESSAMENTO DA MULTIPLICAÇÃO ---
	sll $11, $8, 1 # Multiplica a primeira nota por 2
	add $11, $11, $8 # Soma +1 ao peso, gerando a nota *  peso 3
	
	sll $12, $9, 3 # Multiplica a nota por 8 (2*2*2 = 8)
	add $12, $12, $9 # Adiciona +1 ao peso, gerando a nota *  peso 9
	
	sll $13, $10, 4 #Multiplica a nota por 16, (2*2*2*2 = 16)
	sub $13, $13, $10 # Subtrai -1 ao peso, gerando a nota *  peso 15
	
	# --- PROCESSAMENTO DA SOMA ---
	add $14, $11, $12 # Soma as notas armazenados em $11 e $12, e o armazena em $14
	add $14, $14, $13 # Soma a nota armazenado em $14 com a nota armazenada em $13
	
	addi $15, $0, 3
	addi $15, $15, 9 # Soma os pesos 3 e 9
	addi $15, $15, 15 # Soma o peso 12 (3+9) com o peso 15, gerando o peso 27
	
	# --- PROCESSAMENTO DA DIVISÃO ---
	div $14, $15
	mfhi $16 # Resto da divisão
	mflo $17 # Quociente
	
	# --- SAÍDA DE DADOS ---
	add $4, $0, $17 
	addi $2, $0, 1 # Imprime o quociente (Parte inteira) 
	syscall
	
	addi $4, $0, ','
	addi $2, $0, 11 # Imprime a vírgula que separa o valor inteiro da parte fracionária
	syscall
	
	add $4, $0, $16
	addi $2, $0, 1 # Imprime o resto da divisão (Parte fracionada)
	syscall
	
	# --- ENCERRAMENTO DO PROGRAMA ---
	addi $2, $0, 10
	syscall
