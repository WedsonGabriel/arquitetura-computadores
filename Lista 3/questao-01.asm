# Faça um programa que calcule e mostre os 10 primeiros números múltiplos de 3, considerando valores maiores que 0.

.text
main:
	addi $8, $0, 0 # Adiciona o valor 0 no registrador 8
	addi $9, $0, 0 # i = 0
	addi $10, $0, 10
	
teste:
	addi $9, $9, 1 # i = i + 1
	addi $8, $8, 3 # soma 3 ao $8 
	add $4, $0, $8
	addi $2, $0, 1 # Imprime um multiplo de 3
	syscall
	add $4, $0, '\n'
	addi $2, $0, 11 # Imprime uma quebra de linha
	syscall
	slt $11, $9, $10 # Se i < 10 retorne 1. Senão, retorne 0.
	bne $11, $0, teste # Se $11 for diferente de 0, o laço se repete
sai:
	addi $2, $0, 10 # Encerra o programa
	syscall
