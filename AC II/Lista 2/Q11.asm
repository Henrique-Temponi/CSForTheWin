# j = 0;
#i = 10;
#do
# {
# j = j + 1;
# }
#while ( j != i );
#
# S[0] -> $s0
# j -> $s1
# i -> $s2

.text
.globl main

main:
	
	addi $s0, $zero, 0x1001		# s[0]
	sll $s0, $s0, 16		# $s0 -> pegar a primeira posicao do arranjo
	
	addi $s1, $zero, 0		# j = 0
	addi $s2, $zero, 10		# i = 10
	
	do:
	
		addi $s1, $s1, 1	# j = j + 1
	bne $s1, $s2, do		#
	
	