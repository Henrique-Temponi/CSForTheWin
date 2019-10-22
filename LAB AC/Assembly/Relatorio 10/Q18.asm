# y = x ^ 3 + 1 se x > 0
#   = x ^ 4 - 1 se x <= 0
#
# x -> $s0
# y -> $s1

.text

.globl main

main:
	addi $s0, $zero, 0x1001		#
	sll $s0, $s0, 16		# Pegar endereco
	
	lw $t1, 0($s0)			# carregar valor em t1
	
	mult $t1, $t1			# x ^ 2
	mflo $t2			# pegar valor no low
	mult $t2, $t1			# x ^ 3
	mflo $t2			# pegar valor
	
	slti $t3, $t1, 0		# if ( t1 < 0 )

		beq $t1, $zero, negativo	# 
		bne $t3, $zero, negativo	# if ( t1 <= 0 ) jump negativo
	
		addi $s1, $t2, 1 		# x ^ 3 + 1
		
		sw $s1, 4($s0)			# colocar valor na memoria
	
		j fim
	
	negativo:

		mult $t2, $t1		# x ^4
		mflo $t2		# pegar valor
		
		addi $s1, $t2, -1		# x ^ 4 - 1
		
		sw $s1, 4($s0)		# carregar valor
		
	fim:
	
.data 
	x: .word -1