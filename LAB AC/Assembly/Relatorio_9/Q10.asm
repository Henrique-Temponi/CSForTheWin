
.text
.globl main

main:
	addi $t0, $zero, 0x1001	# Colocar posicao inicial 
	sll $t0, $t0, 16	# Shift Left para concertar o endereco

	lw $s1, 0($t0)		# Carregar o dado (x)
	
	sll $t1, $s1, 7 	# multiplicar por 128x
	sub $t1, $t1, $s1	# subtrair por x (127x)
	
	lw $s1, 4($t0)		# Carregar o dado (z)
	
	sll $t2, $s1, 6		# multiplicar por 64x
	add $t2, $t2, $s1	# adicionar x (65x)
	
	sub $t3, $t1, $t2 	# subtrair x por z
	addi $t3, $t3, 1	# adicionar 1 ao total
	
	sw $t3, 8($t0)
.data
	x: .word 1
	z: .word 1
	y: .word 0 