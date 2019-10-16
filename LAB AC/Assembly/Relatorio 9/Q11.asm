# : y = x – z + 300000
# y -> $s0
# x -> $s1
# z -> $s2

.text

.globl main

main:
	addi $t0, $zero, 0x1001		#
	sll $t0, $t0, 16		# Operacao para colocar o primiero endereco de memoria
	
	addi $t1, $zero, 0x4		#
	sll $t1, $t1, 16		#
	ori $t1, $t1, 0x93E0		# fazer o valor 300000 e quardar 
	
	lw $t2, 0($t0)			# t2 = mem[t0]
	lw $t3, 4($t0)			# t3 = mem[t0 + 4]
	
	sub $t2, $t2, $t3		# x - z
	add $t2, $t2, $t1		# (x - z) + 300000
	
	sw $t2, 8($t0)			# quardar o resultado na memoria
	
.data
	x: .word 100000
	z: .word 200000
	y: .word 0
	