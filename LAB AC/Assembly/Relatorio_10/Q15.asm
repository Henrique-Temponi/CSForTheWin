# fazer um  de 100 posicoes
# preencher com a expresao 2 * i + 1
# fazer o somatorio e quardar na ultima posicao
#
# v[0] -> $s0


.text

.globl main

main:
	addi $s0, $zero, 0x1001		#
	sll $s0, $s0, 16		# Pegar endereco de memoria
	
	addi $t0, $zero, 99		# setar limite da repeticao
	add $t1, $zero, $zero		# zerar uma variavel para a repeticao
	addi $t2, $zero, 2		# colocar 2 para realizar as operacoes
	add $t4, $zero, $zero		# somador
	
	do:
	
		mult $t2, $t1		# 2 * i
		mflo $t3
		
		addi $t3, $t3, 1 	# (2 * i) + 1
		
		add $t4, $t4, $t3	# somador = somador + (2 * i) + 1
		
		sw $t3, 0($s0)		# carregar resultado
		
		addi $t1, $t1, 1	# adicionar na repeticao
		addi $s0, $s0, 4	# ajustar valor do endereco
		
		bne $t0, $t1, do
		
	sw $t4, 0($s0)			# Depois de colocar os valores, colocar a soma deles