# Escreva uma função que receba um número inteiro maior do que zero e retorne a soma de todos os seus
# algarismos. Por exemplo, ao número 251 corresponderá o valor 8 (2 + 5 + 1). Se o número lido não for maior
# do que zero a função retorna -1 e o programa principal terminará com a mensagem "INV".

.text
main:
	# --- ENTRADA DE DADOS ---
	addi $2, $0, 5 # Ler um inteiro
	syscall
	add $8, $0, $2 # Armazena o inteiro no registrador 8
	
	jal somaAlgarismos # Chama a função para somar os algarismos do inteiro digitado
	
	# --- SAÍDA DE DADOS ---
return:
	add $4, $0, $2 # Armazena o valor contido em $2 no registrador 4
	beq $4, -1, inv # Se o valor contido em $4 for igual a -1, vá para a instrução "inv"
	addi $2, $0, 1 # Imprime a soma dos algarismos
	syscall
	j sai # Avança para o encerramento
	
inv:
	addi $4, $0, 'I' 
	addi $2, $0, 11 # Imprime I
	syscall
	addi $4, $0, 'N'
	addi $2, $0, 11 # Imprime N
	syscall
	addi $4, $0, 'V'
	addi $2, $0, 11 # Imprime V
	syscall
	
	# --- ENCERRAMENTO ---
sai:
	addi $2, $0, 10 # Encerra o programa
	syscall
	
	# --- FUNÇÃO somaAlgarismos ---
somaAlgarismos:
	add $2, $0, $0 # Zera o registrador 2
	add $4, $0, $8 # Adiciona no registrador 4 o valor digitado pelo usuário
	addi $9, $0, 10 # Armazena o valor 10 no registrador 9
	
	slt $10, $4, $0 # Verifica se o valor digitado é menor do que zero
	bne $10, $0, menor # Se o valor for diferente de zero, significa que ele é menor.
	beq $4, $0, menor
	
maior:
	div $4, $9 # Divide o valor por 10
	# --- Início do laço ---
teste:
	mflo $11 # Quociente (Divide esse)
	mfhi $12 # Resto (Soma esse)
	add $2, $2, $12 # Soma os algarismos
	beq $11, $0, saiFunction # Se o quociente for igual a 0, vá para a instrução "saiFunction"
	div $11, $9 # Divide o quociente por 10
	j teste
	# --- Fim do laço ---	
menor:
	addi $2, $0, -1 # Armazena o valor -1 no registrador 2
	beq $2, -1, saiFunction # Se o valor contido em $2 foir igual a -1, vá para instrução "saiFunction"
	
saiFunction:
	jr $31 # Retorna para a linha abaixo de jal
