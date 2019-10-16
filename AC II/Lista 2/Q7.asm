# A [ 12 ] = h + A [ 8 ];
# a[0] -> $s0
# h -> $s1

.text
.globl main

main:
	addi $t0, $zero, 0x1001		# 
	sll $s0, $t0, 16		# pegar a primeira posicao da memoria (a[0])
	
	lw $t1, 32($s0)			# pegar o valor na posicao 8
	
	add $t1, $t1, $s1		# h + a[8]
	
	sw $t1, 48($s0)			# a [12] = h + a[8]
	
.data
	
	x1: .word 10
	x2: .word 10
	x3: .word 10
	x4: .word 10
	x5: .word 10