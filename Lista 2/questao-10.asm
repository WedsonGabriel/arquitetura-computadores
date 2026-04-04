# Faça um programa que leia três números e informa a média aritmética simples desses três números, 
# arredondando o resultado para o inteiro mais próximo (a partir 0,5 arredonda para o próximo inteiro maior)

.text
main: 
	# --- ARMAZENAMENTO DE DADOS ---
	addi $8, $0, 0 # Armazena o número 0 no registrador 8
	addi $9, $0, 1 # Armazena o número 1 no registrador 9
	addi $10, $0, 2 # Armazena o número 2 no registrador 10
	addi $11, $0, 3 # Quantidade de notas
	
	# --- LEITURA DE DADOS ---
	addi $2, $0, 5 # Ler a primeira nota
	syscall
	add $12, $0, $2 # Armazena a primeira nota no registrador 12
	
	addi $2, $0, 5 # Ler a segunda nota
	syscall
	add $13, $0, $2 # Armazena a segunda nota no registrador 13
	
	addi $2, $0, 5 # Ler a terceira nota
	syscall
	add $14, $0, $2 # Armazena a terceira nota no registrador 14
	
	# --- PROCESSAMENTO ---
	add $15, $12, $13 # Soma a nota 1 + nota 2
	add $15, $15, $14 # Soma a nota 1 + nota 2 + nota 3
	div $15, $11 # Divide a soma das notas por 3
	mfhi $16 # Resto da divisão
	mflo $17 # Quociente
	
	slt $18, $16, $10 # Verifica se o resto da divisão é menor ou maior do que 2.
	beq $18, $9, menos # Se o resultado for 1, significa que o resto é menor.
	
	# --- SAÍDA DE DADOS ---
mais:
	addi $4, $17, 1 # Soma mais 1 ao quociente e o armazena no registrador 4
	addi $2, $0, 1 # Imprime o quociente + 1 (Arredonda para mais)
	syscall
	j end
	
menos: 
	add $4, $0, $17 # Armazena o quociente no registrador 4
	addi $2, $0, 1 # Imprime o quociente sem casa decimal (Arredonda pra menos)
	syscall
	
	# --- ENCERRAMENTO ---
end:
	addi $2, $0, 10 # Encerra o programa
	syscall
