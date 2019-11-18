#int func1 (int x, int y, int dados){
#	
#	int soma = x + y;
#	
#	return func2 (soma, dados)
#}
#
#int func2 (int x, int dados) {
#	
#	int endereco = dados
#	array[endereco] = x
#	return array[endereco]++
#}

.text

.globl main

main:
	addi $sp, $sp, -4		# reservar espaco na pilha para o t0
	
	addi $t0, $zero, 0x1001		#
	sll $t0, $t0, 16		# Pegar o endereco inicial
	
	sw $t0, 4($sp)			# quardar o valor de t0 na pilha
	
	lw $a0, 0($t0)			#
	lw $a1, 4($t0)			#
	add $a2, $zero, $t0		#
	
	jal func
	
	sw $v0, 8($t0)			#
	j fim		
	
func:
	addi $sp, $sp, -4		# reservar espaco na pilha para o ra
	sw $ra, 4($sp)			# quardar retorno na pilha
	
	add $s0, $a0, $a1		# soma = x + y
	
	addi $sp, $sp, -12		# reservar espaco na pilha para o x e y
	#OBS: e' bom ja reservar tudo na pilha de uma vez? ou aos poucos
	
	sw $a0, 4($sp)			# quardar o x
	sw $a1, 8($sp)			# quardar o y
	sw $s0, 12($sp)			# quardar o soma ($s0)
	
	add $a0, $zero, $s0		# colocar soma no priemiro param
	add $a1, $zero, $a2		# colocar dados no segundo param
	
	jal func2

	lw $a0, 4($sp)			# recuperar valores
	lw $a1, 8($sp)			#
	lw $s0, 12($sp)			#
	lw $ra, 16($sp)			#
	lw $t0, 20($sp)			#
	
	addi $sp, $sp, 20		# resetar pilha
	
	add $v0, $zero, $v0		# 
	jr $ra				#


func2:
	
	add $s0, $zero, $a2		# pegar o endereco e colocar em s0
	
	sw $a0, 8($s0)			# quardar a1 na memoria (soma)
	
	addi $t0, $a0, 1		# pegar a1(soma) e adicionar 1
	add $v0, $zero, $t0		# colocar o valor de retorno em v0
	
#	addi $sp, $sp, -4		# reservar espaco para o retorno
		
	jr $ra
	
fim:

.data
	x: .word 10
	y: .word 10
