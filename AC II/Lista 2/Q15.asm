.text
.globl main
	
	addi $s0, $zero, 0x1001		#
	sll $s0, $s0, 16		# Pegar endereco de memoria
	
	addi $t0, $zero, 99		# setar limite da repeticao
	add $t1, $zero, $zero		# zerar uma variavel para a repeticao
	addi $t3, $zero, 1		#
	
	do_1:
		sw $t3, 0($s0)		# carregar resultado
		
		addi $t1, $t1, 1	# adicionar na repeticao
		addi $s0, $s0, 4	# ajustar valor do endereco
		
		bne $t0, $t1, do_1


# Instruções da ALU -> 3;
# Instruções de Desvio -> 4;
# Instruções de MEM -> 5;
# A maquina funcionando a 100 MHz
# Calcular CPI medio
#    ||	   CPU Time
# 
# a[0] -> $s1


main:
	
	addi $s1, $zero, 0x1001		# 						Operacao de ALU = 1
	sll $s1, $s1, 16		# Pegar endereco de memoria			Operacao de ALU = 2
	
	addi $t0, $zero, 99		# setar limite da repeticao			Operacao de ALU = 3
	add $t1, $zero, $zero		# zerar uma variavel para a repeticao		Operacao de ALU = 4
	
	do:		
		lw $t3, 0($s0)		# carregar resultado				Operacao de MEM = 1
		
		add $t2, $t2, $t3	# fazer somatorio				Operacao de ALU = 5
		addi $t1, $t1, 1	# adicionar na repeticao			Operacao de ALU = 6
		addi $s1, $s1, 4	# ajustar valor do endereco			Operacao de ALU = 7
		
		bne $t0, $t1, do	#						Operacao de Devio = 1
		
	sw $t2, 4($s1)			#						Operacao de MEM = 2
	
	# Programa final com 
	# Instruções da ALU 	3 -> 	7 x 99 = 639 -|
	# Instruções de Desvio 	4 ->	1 x 99 = 99  -|> = 936
	# Instruções de MEM 	5 -> 	2 x 99 = 198 -|
	# Funcionando a 100 MHz = 10 ns 
	# o programa vai ser executado 99 vezes
	
	# CPI Medio =  ( 3 x 639 ) + ( 4 x 99 ) + ( 5 x 198 ) =  1917 +  396 + 990 = 3303 = 3,5 -> CPI Medio
	#	       ---------------------------------------------------------------------
	#				936                              936         936
	
	# CPU Time = 936 x 3,5 x 10 ns = 32760 ns
	#
	# Agora implemente um melhoria e calcule o speed-up com base nisso
	# (so vamos colocar 2 nops aqui dentro do loop)
	
	addi $s1, $zero, 0x1001		# 						Operacao de ALU = 1
	sll $s1, $s1, 16		# Pegar endereco de memoria			Operacao de ALU = 2
	
	addi $t0, $zero, 99		# setar limite da repeticao			Operacao de ALU = 3
	add $t1, $zero, $zero		# zerar uma variavel para a repeticao		Operacao de ALU = 4
	
	do:		
		lw $t3, 0($s0)		# carregar resultado				Operacao de MEM = 1
		
		add $t2, $t2, $t3	# fazer somatorio				Operacao de ALU = 5
		addi $t1, $t1, 1	# adicionar na repeticao			Operacao de ALU = 6
		addi $s1, $s1, 4	# ajustar valor do endereco			Operacao de ALU = 7
		
		bne $t0, $t1, do	#						Operacao de Devio = 1
		
		nop 			#						Operacao de ALU = 8
		nop 			#						Operacao de ALU = 9
		
	sw $t2, 4($s1)			#						Operacao de MEM = 2
	
	# Programa final com 
	# Instruções da ALU 	3 -> 	9 x 99 = 891 -|
	# Instruções de Desvio 	4 ->	1 x 99 = 99  -|> = 1188
	# Instruções de MEM 	5 -> 	2 x 99 = 198 -|
	# Funcionando a 100 MHz = 10 ns 
	# o programa vai ser executado 99 vezes
	
	# CPI Medio =  ( 3 x 891 ) + ( 4 x 99 ) + ( 5 x 198 ) =  2673 +  396 + 990 = 4059 = 3,4 -> CPI Medio
	#	       ---------------------------------------------------------------------
	#				1188                             1188        1188
	
	# CPU Time = 1188 x 3,4 x 10 ns = 40392 ns
	
	# Calculando o speedup de ambos, vamos ter o resultado
	# 
	# 40392
	#------- = O speed up foi de 1,2
	# 32760