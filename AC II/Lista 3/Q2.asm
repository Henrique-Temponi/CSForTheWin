# Escreva um programa que em main leia dois números armazenados na memória (considere dois
# registradores quaisquer com esses endereços, exemplo: $s0 e $s1) e passe esses dois números lidos
# na memória para uma função. A função receberá esses dois números e retornará o primeiro elevado
# ao segundo. Esse resultado deverá ser armazenado na posição seguinte a $s2. O programa rodará
# indefinidamente até que o primeiro número seja 0 (zero)
#
# primeiro numero -> $s0
# segundo numero -> $s1

.globl main

main:

	addi $t0, $zero, 0x1001	#
	sll $t0, $t0, 16	#
	
	lw $s0, 0($t0)		#
	lw $s1, 4($t0)		#
	
	add $a0,$zero, $s0	#
	add $a1, $zero, $s1	#
	
	addi $t0, $t0, 8
	
	do:
		jal elevar
		addi $a0, $a0, -1
		sw $v0, 0($t0)
		addi $t0, $t0, 4
	
	bne $a0, $zero, do
	
	j fim
	
	
elevar:

	beq $a1, $zero, return	#
	
	addi $sp, $sp, -4	#
	sw $a0, 4($sp)		#
	sw $a1, 8($sp)		#
	
	do1:
	
		mult $a0, $a0		#
		mflo $a0		#
					#
		add $a1, $a1, -1	#
		
	bne $a1, $zero, do1
	
	add $v0, $zero, $s0	#
	
	lw $a0, 4($sp)		#
	lw $a1, 8($sp)		#
	
	return:
	jr $ra			#

fim:
.data
	x: .word 10
	y: .word 10
