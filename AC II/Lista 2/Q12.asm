# Calcular os 100 primeiros valores da serie de fibonatti
# x -> s0
# y -> s1
# s[0] -> $s2
# tcontrole -> t0

.text
.globl main

main:

	addi $s0, $zero, 1		# zerar valor x
	add $s1, $zero, $zero		# zerar valor y
	addi $t0, $zero, 100		# zerar valor contador
	
	addi $s2, $zero, 0x1001		# s[0]
	sll $s2, $s2, 16		# $s2 -> pegar a primeira posicao do arranjo
	
	add $s0, $zero, $s0	# fib(n) + fib(n - 1)
	
	sw $s0, 0($s2)		#
	addi $s2, $s2, 4	#
	
	do:
		
		add $s0, $s0, $s1	# fib(n) + fib(n - 1),
		
		sw $s0, 0($s2)		#
		addi $s2, $s2, 4	#
		
		lw $s1, -8($s2)		# pegar o ultimo valor quardado na memoria
		
		addi $t0, $t0, -1	#
		
	bne $t0, $zero, do
		
	
	