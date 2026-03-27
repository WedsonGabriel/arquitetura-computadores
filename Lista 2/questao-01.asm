# Faça um programa para ler dois números e informe qual deles é o maior.

.text
main:
	# --- LEITURA DE DADOS ---
	addi $2, $0, 5 # Ler o primeiro número
	syscall
	add $8, $0, $2 # Armazena o número no $8
	
	addi $2, $0, 5 # Ler o segundo número
	syscall
	add $9, $0, $2 # Armazena o número no $9
	
	# --- PROCESSAMENTO ---
	slt $10, $8, $9 # Verifica se $8 < $9. 
	beq $10, $0, OptionMaior1 # Verifica se $10 é igual a $0 (0=0). Se sim, então $8 > $9.
	
OptionMaior2:
	add $4, $0, $9 # Se $8 não for maior do que $9, ele imprimirá $9
	j print
	
OptionMaior1: 
	add $4, $0, $8 # Se $8 for maior do que $9, ele imprimirá $8
	
	# --- SAÍDA DE DADOS ---
print:
	addi $2, $0, 1 # Imprime o maior número
	syscall
	
	# --- ENCERRAMENTO ---
	addi $2, $0, 10
	syscall
