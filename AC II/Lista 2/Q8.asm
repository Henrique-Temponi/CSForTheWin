# h = k + A [ i ] ;
# a[0] -> $s0
# h -> $s1
# i -> $s2
# k -> $s3

.text
.globl main

main:
	addi $s0, $zero, 0x1001		#
	sll $s0, $s0, 16		#  $s0 -> pegar a primeira posicao do arranjo
	
	sll $s2, $s2, 2			#
	add $s2, $s2, $s0		# adicionar o indice a primeira posicao do arranjo
	
	lw $t0, 0($s2)			# carregar valor do arranjo
	
	add $s1, $t0, $s3		# h = k + a[i]
	 
	 
.data
	
	