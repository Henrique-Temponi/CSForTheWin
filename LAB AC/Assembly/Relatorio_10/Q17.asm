# y = x ^4 + x ^2 - 2x ^2
#   = x ^5 - x ^3 + 1
# utilizar a primeira se par
# utilizar a segunda se impar 
#
# o valor de x dever ser lido do primeiro valor da memoria
# e gravar o y na memoria
# x -> $s0
# y -> $s0

.text

.globl main

main:
	
	addi $s0, $zero, 0x1001		#
	sll $s0, $s0, 16		# Pegar endereco
	
	lw $t1, 0($s0)			# carregar valor em t1
	andi $t2, $t1, 1		# testar o ultimo bit (Big endian)
	
	
	bne $t2, $zero, impar		# if ( t1 != 0 ) goto: impar
	
		mult $t1, $t1			# x * x
		mflo $t2			# pegar valor no low
	
		add $t3, $t2, $t2		# t3 = 2x ^ 2
		
		mult $t2, $t2			# (x * x) * (x * x)	
		mflo $t4			# t4 = x ^ 4
	
		add $t5, $t2, $t4		# y = x ^ 2 + x ^ 4
		sub $t5, $t5, $t3		# y = x ^ 2 + x ^ 4 + 2x ^ 2
	
		sw $t5, 4($s0)			#
	
	j fim
	
	impar:
		mult $t1, $t1			# x ^ 2
		mflo $t2			# pegar valor no low
		mult $t2, $t1			# x ^ 3
		mflo $t2			# pegar valor
		
		mult $t2, $t1			# x ^ 4
		mflo $t3		
		mult $t3, $t1			# x ^ 5
		mflo $t3			
		
		addi $t3, $t3, 1		# x ^ 5 + 1
		sub $t3, $t3, $t2		# (x ^ 5 + 1) - x ^ 3
		
		sw $t3, 4($s0)
	fim:
	
.data 
	x: .word 3