# Faça uma função chamada DesenhaLinha. Ele deve desenhar uma linha na tela usando vários símbolos
# de igual (Ex: ========). A função recebe por parâmetro quantos sinais de igual serão mostrados.

.text
main:
	# --- ENTRADA DE DADOS ---
	addi $2, $0, 5
	syscall
	add $4, $0, $2
	jal DesenhaLinha
		
	# --- ENCERRAMENTO ---
return:
	addi $2, $0, 10
	syscall
	
	# --- FUNÇÃO DesenhaLinha ---
DesenhaLinha: 
	add $8, $0, $4
	
	# --- Início do laço ---
teste: 
	beq $8, $0, sai
	addi $4, $0, '='
	addi $2, $0, 11
	syscall
	sub $8, $8, 1
	j teste
	# --- Fim do laço ---
sai:
	jr $31
