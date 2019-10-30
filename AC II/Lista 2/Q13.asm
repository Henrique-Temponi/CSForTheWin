# Ler da memoria um valor, e determinar se ele esta no dado intervalo
# 50 a 100 OU
# 150 a 200
# 
#

.text
.globl main

main:

	addi $t0, $zero, 0x1001		#
	sll $t0, $t0, 16		# colocar o primeiro endereco na memoria
	
	lw $s0, 0($t0)			# load temp
	lw $s1, 4($t0)			# load flag
	
	addi $t2, $zero, 50		# 
	addi $t3, $zero, 101
	
	addi $t4, $zero, 150		# 
	addi $t5, $zero, 201		# 
	
	
	slt $t1, $s0, $t2 		# if (temp < 50)
	slt $t6, $s0, $t3		# if (temp < 101)
	bne $t1, $t6, toggle		#
	
	slt $t1, $s0, $t4		# if (temp < 150)
	slt $t1, $s0, $t5		# if (temp < 200)
	bne $t1, $t6, toggle		#

	and $s1, $zero, $s1		# zerar a flag
	sw $s1, 4($t0)			# carregar valor na memoria
	j fim
		
toggle:
	
	ori $s1, $zero, 1		# colocar um na flag a flag
	sw $s1, 4($t0)			# carregar valor na memoria


fim:	


.data
	Temp: .word 100
	Flag: .word -1
