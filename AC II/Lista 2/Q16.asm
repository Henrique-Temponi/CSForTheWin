#-Repita os cálculos anteriores para o seguinte programa em MIPS:
# se Considerar o s2 como 0, podemos concluir que ira rodar 99 vezes o codigo abaixo
# se colocar qualquer outro numero em s2 tbm ira dar 99, ja que ele compenca adicionando o s2 no inicio do programa
#
	addi $s3, $s2, 396 		# Opercao de ALU = 1

	loop:
		lw $s1, 0($s2)		# Opercao de MEM = 1
		addi $s1, $s1, 1	# Opercao de ALU = 2
		sw $s1, 0 ($s2)		# Opercao de MEM = 2
		addi $s2, $s2, 4	# Opercao de ALU = 3
		sub $s4, $s3, $s2	# Opercao de ALU = 4
		bne $s4, $zero, loop	# Opercao de Desvio = 1 
	
	# Programa final com 
	# Instruções da ALU 	3 -> 	4 x 99 = 396 -|
	# Instruções de Desvio 	4 ->	1 x 99 = 99  -|> = 693
	# Instruções de MEM 	5 -> 	2 x 99 = 198 -|
	# Funcionando a 100 MHz = 10 ns 
	# o programa vai ser executado 99 vezes
	
	# CPI Medio =  ( 3 x 396 ) + ( 4 x 99 ) + ( 5 x 198 ) =  1188 +  396 + 990 = 2574 = 3,7 -> CPI Medio
	#	       ---------------------------------------------------------------------
	#				693                              693         693
	
	# CPU Time = 693 x 3,7 x 10 ns = 25641 ns