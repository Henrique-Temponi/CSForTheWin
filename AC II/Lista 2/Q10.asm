#h = A [ i ] ;
#A[ i ] = A [ i + 1] ;
#A [ i + 1] = h ;
# a[0] -> $s0
# i -> $s2
# h -> $s3

.text
.globl main

main:
	addi $s0, $zero, 0x1001		# s[0]
	sll $s0, $s0, 16		#  $s0 -> pegar a primeira posicao do arranjo
	
	sll $s1, $s1, 2			# i
	add $s1, $s1, $s0		# adicionar o indice a primeira posicao do arranjo
	
	lw $s3, 0($s1)			# h = a [ i ]
	
	lw $t0, 4($s1)			# t0 = a [i + 1]
	sw $t0, 0($s1)			# a[i] = a [i + 1]
	
	sw $s3, 4($s1)			# a[i + 1] = h
	
	