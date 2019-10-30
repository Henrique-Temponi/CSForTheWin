# Escreva uma função que receba como argumentos 2 números inteiros de 32 bits.
# Essa função deverá também retornar um inteiro.
# O primeiro número recebido como parâmetro representa um endereço de memória e o segundo uma quantidade de elementos.
# Sua função deverá criar um vetor que tem início nesse endereço de memória (primeiro argumento)
# e a quantidade de elementos desse vetor dadas pelo segundo argumento.
# Cada elemento do vetor é um elemento da série:y[i] = 2i –1 se i for par;y[i] = i se i for impar.
# O valor retornado será a soma de todos os elementos de y[].
#
#

.text
.globl main

main:
	addi $a0, $zero, 0x1001		#
	sll $a0, $a0, 16		#
	
	addi $a1, $zero, 4		#
	
	jal func			# chamar funcao
	
	sw $v0, 0($v1)			# adicionar o somatorio retornado da funcao ao endereco retornado
	
	j end


	func:
	
	add $t1, $zero, $zero		#
	
	do:
	
		and $t0, $a1, 1		# ( 0 & 1 ) = par / ( 1 & 1 ) = impar
		beq $t0, $zero, par	#
		
			sw $a1, 0($a0)		# quardar o valor de i ( se impar = a[i] = i
			add $t1, $t1, $a1	# adicionar no somatorio
			j fim		 	# pular para o fim da repeticao
		
		par:
		
			sll $t0, $a1, 1		# 2i
			addi $t0, $t0, -1	# 2i - 1
		
			sw $t0, 0($a0)		# quardar o valor de i ( se par a[i] = 2i - 1 )
			add $t1, $t1, $t0	# adicionar no somatorio
		
		fim:
		
		
		addi $a0, $a0, 4	# ajustar valor do endereco
		addi $a1, $a1 -1	# subtrair a quantidade total
		bne $a1, $zero, do	# comparar a zero como parada da repeticao
		
	add $v0, $zero, $t1		#
	add $v1, $zero, $a0
	jr $ra
		
	end:
	