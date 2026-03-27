# Faça um programa que receba três notas (entre 0 e 100) e calcule a média ponderada dessas notas 
# com pesos 1, 2 e 3. Informe a média e se o aluno foi aprovado, escreva após a média a letra A.
# Caso o aluno seja reprovado, informe, após a média, a letra R. A média para aprovação é 60.

.text
main:
	# --- ARMAZENAMENTO DE DADOS ---
	addi $8, $0, 1 # Peso 1
	addi $9, $0, 2 # Peso 2
	addi $10, $0, 3 # Peso 3
	addi $11, $0, 6 # Peso Total (Somatória)
	addi $12, $0, 60 # Média para aprovação
	
	# --- LEITURA DE DADOS ---
	addi $2, $0, 5 # Ler a primeira nota
	syscall
	add $13, $0, $2 # Armazena a primeira nota no registrador 13
	
	addi $2, $0, 5 # Ler a segunda nota
	syscall
	add $14, $0, $2 # Armazena a segunda nota no registrador 14
	
	addi $2, $0, 5 # Ler a terceira nota
	syscall
	add $15, $0, $2 # Armazena a terceira nota no registrador 15
	
	# --- PROCESSAMENTO ---
	mul $16, $13, $8 # Nota 1 * Peso 1
	mul $17, $14, $9 # Nota 2 * Peso 2
	mul $18, $15, $10 #Nota 3 * Peso 3
	
	add $19, $16, $17 # (Nota 1 * Peso 1) + (Nota 2 * Peso 2)
	add $19, $19, $18 # ((Nota 1 * Peso 1) + (Nota 2 * Peso 2)) + (Nota 3 * Peso 3)
	
	div $19, $11 # Divide as notas multiplicadas pelos seus respectivos pesos, pela somatória dos pesos
	mflo $20 # Armazena o quociente da divisão no registrador 20
	
	# --- CONDICIONAL ---
	beq $20, $12, aprovado # Verifica se o quociente é igual a 60
	slt $21, $20, $12 # Verifica se o quociente é menor ou maior do que a média
	beq $21, $0, aprovado # Se o quociente for igual a 0, significa que ele é maior. Logo, o aluno está aprovado
	
	# --- SAÍDA DE DADOS ---
reprovado:
	add $4, $0, $20
	addi $2, $0, 1 # Imprime a nota
	syscall
	addi $4, $0, '-'
	addi $2, $0, 11 # Imprime um hífen
	syscall
	addi $4, $0, 'R'
	addi $2, $0, 11 # Imprime R
	syscall
	j end
	
aprovado:
	add $4, $0, $20
	addi $2, $0, 1 # Imprime a nota
	syscall
	addi $4, $0, '-'
	addi $2, $0, 11 # Imprime um hífen
	syscall
	addi $4, $0, 'A'
	addi $2, $0, 11 # Imprime A
	syscall
	
	# --- ENCERRAMENTO ---
end:
	addi $2, $0, 10
	syscall
