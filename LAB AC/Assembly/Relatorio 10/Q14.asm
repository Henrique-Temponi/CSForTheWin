
# Ler da memoria temp e flag
# se 30 <= temp <= 50
# colocar a flag como 1
# se nao 0
#
# temp = $s0
# flag = $s1

.text

.globl main

main:

	addi $t0, $zero, 0x1001		#
	sll $t0, $t0, 16		# colocar o primeiro endereco na memoria
	
	lw $s0, 0($t0)			# load temp
	lw $s1, 4($t0)			# load flag
	
	addi $t2, $zero, 30		# 
	addi $t3, $zero, 50		# 
	
	slt $t1, $t3, $s0 		# if (50 < temp)
	bne $t1, $zero, nao_intervalo	#
	slt $t1, $s0, $t1		# if (temp < 30)
	bne $t1, $zero, nao_intervalo	#

	ori $s1, $zero, 1		# colocar um na flag a flag
	sw $s1, 4($t0)			# carregar valor na memoria
	j fim
		
nao_intervalo:
	
	and $s1, $zero, $s1		# zerar a flag
	sw $s1, 4($t0)			# carregar valor na memoria

fim:	


.data
	Temp: .word 50
	Flag: .word -1
