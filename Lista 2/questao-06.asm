# Faça um programa que leia a idade (em anos) e o tempo de serviço de um trabalhador.
# Informe se ele pode se aposentar (imprima S se sim, e N se não). As condições para aposentadoria são:
# 1) ter, ao menos, 65 anos; OU
# 2) ter trabalhado 40 anos; OU
# ter pelo menos 60 anos e mais de 35 anos.

.text
main:
	# --- ARMAZENAMENTO INICIAL ---
	addi $8, $0, 65 # Armazena o valor 65 no $8
	addi $9, $0, 40 # Armazena o valor 40 no $9
	addi $10, $0, 60 # Armazena o valor 60 no $10
	addi $11, $0, 35 # Armazena o valor 35 no $11
	
	# --- LEITURA DE DADOS ---
	addi $2, $0, 5 # Ler a idade do trabalhador
	syscall
	add $12, $0, $2 # Armazena a idade do trabalhador no $12
	
	addi $2, $0, 5 # Ler o tempo de serviço do trabalhador
	syscall
	add $13, $0, $2 # Armazena o tempo de serviço do trabalhador no $13
	
	# --- PROCESSAMENTO ---
	# Casos individuais
	slt $14, $12, $8 # Verifica se a idade do trabalhador é menor do que 65.
	beq $14, $0, Pode_aposentar # Se for maior ou igual, o resultado do slt será zero. Assim, ele pode se aposentar.
	
	slt $14, $13, $9 # Verifica se o trabalhador tem mais de 40 anos de serviço.
	beq $14, $0, Pode_aposentar # Se for maior ou igual, o resultado do slt será zero. Assim, ele pode se aposentar.
	
	# Caso and
	slt $14, $12, $10 # Verifica se a idade do trabalhador é menor do que 60.
	slt $15, $13, $11 # Verifica se o trabalhador tem mais de 35 anos de serviço.
	beq $14, $15, Pode_aposentar # Se ambos resultados forem igual a zero, o trabalhador pode se aposentar
	
	# --- SAÍDA DE DADOS ---
Não_pode_aposentar:
	addi $4, $0, 'N'
	addi $2, $0, 11 # Imprime o N, pois o trabalhador não está apto a se aposentar ainda
	syscall
	j end
	
Pode_aposentar:
	addi $4, $0, 'S'
	addi $2, $0, 11 # Imprime o S, pois o trabalhador está apto a se aposentar
	syscall
	
	# --- ENCERRAMENTO ---
end:
	addi $2, $0, 10 # Encerra o programa
	syscall
