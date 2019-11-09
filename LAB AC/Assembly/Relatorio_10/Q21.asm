#
# fazer a seguinte expressao:
# k = x ^ y
# onde y e' a quantidade que x vai ser elvado
#
# x -> $s0
# y -> $s1
# k -> $s3

.text

.globl main

main:

	
	addi $t0, $zero, 0x1001		#
	sll $t0, $t0, 16		# Pegar endereco
	
	lw $s0, 0($t0)			# carregar valor em s0 (x)
	lw $s1, 4($t0)			# carregar valor em s1 (y)
	
	beq $s1, $zero, fim
	
		mult $s0, $s0			# multiplicar valor
		mflo $t1			# pegar valor
	
		addi $s1, $s1, -1		
		
		loop: beq $s1, $zero, fim	# if ( y == 0 ) goto: fim
		
			mult $t1, $s0		#
			mflo $t1		#
			
			addi $s1, $s1, -1	#		
			
			j loop			# volta para a condicional do loop
			
	fim:
	
	sw $t1, 8($t0)
	
	
.data 
	x: .word 10
	y: .word 2
	k: .word -1