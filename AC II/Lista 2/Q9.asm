# A [ j ] = h + A [ i ] ;
# A[0] -> $S0
# J -> $s1
# i -> $s2
# h -> $s3

.text

.globl main

main:

	addi $s0, $zero, 0x1001		#
	sll $s0, $s0, 16		#  $s0 -> pegar a primeira posicao do arranjo
	
	sll $s2, $s2, 2			# i
	add $s2, $s2, $s0		# adicionar o indice a primeira posicao do arranjo
	
	sll $s1, $s1, 2			# j
	add $s1, $s1, $s0		# adicionar o indice a primeira posicao do arranjo
	
	lw $t0, 0($s2)			# carregar valor do arranjo
	add $s3, $t0, $s3		# h = k + a[i], quardar em h
	
	sw $s3, 0($s1)			#
	
.data

	x1: .word 10
	x2: .word 12
	x3: .word 1123
	x4: .word 1213
	x5: .word 123
	x6: .word 789
	x7: .word 74
	x8: .word 567
	x9: .word 177013
	x10: .word 692434
