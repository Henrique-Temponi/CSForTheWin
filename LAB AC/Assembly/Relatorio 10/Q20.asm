#
# k = x * y
# x -> $s0
# y -> $s1
# k -> $s1

.text

.globl main

main:

	
	addi $t0, $zero, 0x1001		#
	sll $t0, $t0, 16		# Pegar endereco
	
	lw $s0, 0($t0)			# carregar valor em s0 (x)
	lw $s1, 4($t0)			# carregar valor em s1 (y)
		
	mult $s0, $s1			# multiplicar o valor e pegar o resultado
	mflo $t1			#
	
	sw $t1, 8($t0)			# quardar o valor


.data 
	x: .word 10
	y: .word 10
	k: .word -1