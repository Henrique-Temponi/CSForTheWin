# k = MEM [ MEM [MEM [ x ] ] ]. 
# k -> $s0
.text

.globl main

main:
	addi $t0, $zero, 0x1001		#
	sll $t0, $t0, 16		#
	sw $t0, 4($t0)			# Operacao para colocar o primiero endereco de memoria
	
	addi $t0, $t0, 0x4		#
	sw $t0, 4($t0)			# 
	addi $t0, $t0, 0x4		#
	sw $t0, 4($t0)			# Coloca o valores dos ponteiros na memoria
	
	lw $t1, 0($t0)			# 
	lw $t1, 0($t1)			#
	lw $s0, 0($t1)			# pega o valor final apontado
	
	sll $s0, $s0, 1			# mutiplica por 2
	
	sw $s0, 0($t1)			# colocar o valor de s0 na memoria
	
.data
	k: .word 2