# Ler da memoria temp e flag
# se 30 <= temp => 50
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
	
	slti $t1, $s0, 50		# if (tmep < 50)
	
	beq $t1, $zero, nao_intervalo	#
	
	
	
	
	
nao_intervalo:
	
	and $s1, $zero, $s1		# zerar a flag
	sw $s1, 4($t0)			# carregar valor na memoria
	
.data
	Temp: .word 40
	Flag: .word -1
