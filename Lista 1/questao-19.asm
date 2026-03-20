# Em Edulândia o calendário é muito parecido com o nosso, exceto pelo fato de não existirem anos bissextos
# e o mês de fevereiro ter uma quantidade fixa de dias, isso é, 30. Faça um programa que leia um inteiro
# representando um mês do ano Edulandês e imprima a quantidade de dias que tem esse mês.

.text
main:
	# --- ARMAZENAMENTO INICIAL ---
	addi $8, $0, 8 # Armazena o número 8 no registrador 8
	
	# --- LEITURA DE DADOS ---
	addi $2, $0, 5 # Ler o mês
	syscall
	add $9, $0, $2 # Armazena o número do mês no registrador 9
	
	# --- PROCESSAMENTO ---
	div $9, $8 # Divide o número do mês por 8
	mflo $10 # Adiciona o resultado da divisão ao registrador 10
	add $11, $10, $9 # Quociente + Mês 
	
	andi $12, $11, 1 # Transforma o  inteiro em binário e detecta o último dígito (0 ou 1)
	addi $13, $12, 30 # Soma 0 ou 1 ao número 30, gerando a quantidade de dias do mês (30 ou 31)
	
	# --- SAÍDA DE DADOS ---
	add $4, $0, $13
	addi $2, $0, 1 # Imprime a quantidade de dias
	syscall
	
	# --- ENCERRAMENTO DO PROGRAMA ---
	addi $2, $0, 10
	syscall
