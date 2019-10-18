.text
.globl main

main:
	addi $t0, $zero, 0x1001		#
	sll $t0, $t0, 16		# Colocar o endereco no registrador
	
	lw $t1, 0($t0)			# Carregar Valor de a no registrador
	
	slt $t2, $t1, $zero		# -1 < 0
	bne $t2, $zero, modulo		# if ( 1 != 0 )
	j fim
modulo:
	sub $t1, $zero, $t1		# 0 - ( - 1 )

fim:	
	sw $t1, 0($t0)
	
.data
	A: .word 100
	