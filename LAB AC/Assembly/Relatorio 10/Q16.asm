#
# Ordernar o vetor, dado um certo numero
# usando o metodo bolha
#
# s[0] -> $s0

.text

.globl main

main:

	addi $t0, $zero, 3		# tamanho do arranjo
	
	addi $s0, $zero, 0x1001		#
	sll $s0, $s0, 16		# Pegar endereco de memoria
	
	add $t1, $zero, $t0		# numero de repeticao ( tamanho do arranjo )
	
	do_encher:				# esse loop vai preencher o arranjo com numeros aleatorios
	
		addi $t1, $t1, -1	# subtrair da repeticao
	
		mult $s0, $t1		# endereco * indice do loop
		mflo $t2
		
		addi $t2, $t2, 1 	# (endereco * indice do loop) + 1
		
		sw $t2, 0($s0)		# carregar resultado
		
		addi $s0, $s0, 4	# ajustar valor do endereco
		
		bne $t1, $zero, do_encher	# while ( numero de repeticao != 0 )
		
	# agora e' tentar ordernar essa bagaca
	
	
		addi $t2, $t0, -1		#
	do_2:
	
		
		add $t6, $zero, $t2		# contador loop interno ( y )
		addi $t1, $s0, -4		# ajustar o valor para o ultima posicao com valor
		
		do_1:
			
			
			
			lw $t3, 0($t1)			# carregar v[i]
			lw $t4, -4($t1)			# carregar v[i - 1]	
		
			slt $t5, $t3, $t4		# if ( v[i] < v[i - 1] )
			bne $t5, $zero, swap		# se o valor atual for menor, swap
			
			j fim
			
			swap:
				
				add $t5, $zero, $t4	# tmp = v[i - 1]
				sw $t3, -4($t1)		# v[i - 1] = v[i]
				sw $t5, 0($t1)		# v[i] = tmp
			
			fim:
				addi $t6, $t6, -1 		# y = y - 1
				addi $t1, $t1, -4		# ajustar endereco
		
		bne $t6, $zero, do_1
		
		addi $t2, $t2, -1		#
		
		
	bne $t2, $zero, do_2
		