.text
.globl main

main:
	addi $t0, $zero, 0x1001	# Colocar o primeiro endereco A[x]
	sll $t0, $t0, 16	# Shift Left 16 bits
	addi $t2, $t0, 16 	# Colocar o limite da repeticao
	
	test:
		lw $t1, 0($t0)		# carrega a posicao atual para registrador
		add $t3, $t3, $t1	# somar o numero antigo com o atual	
		addi $t0, $t0, 4	# depois somar mais 4 na memoria para pegar proxima possiao
	bne $t2, $t0, test
	
	sw $t3, 0($t0)
	
.data
	x1: .word 15
	x2: .word 25
	x3: .word 13
	x4: .word 17
	soma: .word -1