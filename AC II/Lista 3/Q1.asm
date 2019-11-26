# Fazer uma funcao para receber um endereco de inicio e quantidade (ate 32 bits) e retornar a soma do arranjo
# Fazer uma funcao para elevar um numero ao quadrado, (maximo 16 bits)
# Ler da memoria o endereco e quantidade e passar para a funcao
# y[i] = 2i2 + 2i+1 se i for par;
# y[i] = i2 se i for impar. 
#
# y[0] -> $s0
# i -> $s1 
#

.globl main

main:
	addi $t0, $zero, 0x1001		#
	sll $t0, $t0, 16		# pegar endereco principal
	
	lw $s0, 0($t0)			# 
	lw $s1, 4($t0)			# carregar valores
	
	add $a0, $zero, $s0		# a0 = endereco
	add $a1, $zero, $s1		# a1 = quantidade
	
	
	jal fazerArranjo		# chama funcao
	
	

fazerArranjo:
	
	 add $t1, $zero, $zero		# somador
	 slti $t0, $a1, 31		# if ( param < 31) , t0 = 1
	 bne $t0, $zero, paramValido	#
	 	addi $a1, $zero, 30	# ajudar param para 30 se o valor inicial for maior que 30
	 paramValido:
	
	addi $sp, $sp, -4	# reservar espaco na pilha
	
	 do:
		andi $t0, $a1, 1	# conferir se numero e' par, 1 se par, 0 se impar
		bne $t0, $zero, impar
			
			sw $ra, 4($sp)		# quardar o valor da funcao na pilha
			
			jal elevar		# charmar fucnao elevar
			
			add $t0, $v0, $zero	# somar o retorno elevado
			sll $t0, $t0, 2		# multiplicar ´por dois
			add $t0, $t0, $v0	# somar o resultado disso com o mesmo resultado elevado
			addi $t0, $t0, 1	# somar 1 a isso tudo
			
			add $t1, $t1, $t0	# somar no somador
			
			sw $t0, 0($a0)		# quardar na memoria o resultado
			
			j skip
			
		impar:
			sw $ra, 4($sp)		# salvar o retorno da funcao ($ra)
			
			jal elevar		# chamar funcao elevar
			
			lw $ra, 4($sp)		# carregar valor de ra da pilha
			
			add $t1, $t1, $v0	# somar ao somador
			
			sw $v0, 0($a0)		# quardar o resuldade da eleva na memoria

		skip:
		
		addi $a0, $a0, 4	#
		addi $a1, $a1, -1	#
		
	bne $a1, $zero, do	# while ( param != zero ) goto do
	 
	addi $sp, $sp, 4	# restalrar pilha
	
	j fim

elevar:
	
	mult $a1, $a1		# .
	mflo $v0		# .
	
	jr $ra			# .
	
fim:
.data
	x: .word 0x10010008
	y: .word 10
