# Ler treis valores da memoria e falar qual e' a mediana entre eles
# ex: se tiver 3, 5, 6 a media seria o 5
#
# x -> $s0
# y -> $s1
# z -> $s2

.text
.globl main

main:

	addi $t0, $zero, 0x1001		#
	sll $t0, $t0, 16		# colocar o primeiro endereco na memoria
	
	addi $t4, $zero, 2		#

	do:
	
		lw $t1, 0($t0)		#
		lw $t2, 4($t0)		#
		
		slt $t3, $t1, $t2	# if ($t1 < $t2)
		bne $t3, $zero, fim	#
		
		sw $t2, 0($t0)		#
		sw $t1, 4($t0)		#
		
		
		fim:
		
		addi $t0, $t0, 4	#
		addi $t4, $t4, -1	#
		bne $t4, $zero, do	#
		
		
	#supondo que os numeros agoras foram ordernados pegar o segundo
	lw $t5, -4($t0)
	sw $t5, 4($t0)
	
	
.data
	x: .word 10
	y: .word 25
	z: .word 50
