.text
.globl main

main:
	
	addi $t0, $zero, 0x1001	# Coloca numero para endereco
	sll $t0, $t0, 16	# Shfit para caber os cdados, Coloca o restante do numero, criando A[x1]
	
	lw $s0, 0($t0)		# Carrega a palavra no resgistror $s0
	lw $s1, 4($t0)		# Carrega a palavra no resgistror $s1
	
	add $t1, $s0, $s1 	# adiciona t0 = x1 + x2
	
	sw $t1, 0($t0)		# Quarda o t0 em x3
	j main
	
.data
	x1: .word 1
	x2: .word 3
	x3: .word 5
	x4: .word 7