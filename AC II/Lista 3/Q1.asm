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
	
	 slti $t0, $a1, 31		#
	 bne $t0, $zero, paramValido	#
	 	addi $a1, $zero, 30	# ajudar param para 30 se o valor inicial for maior que 30
	 paramValido:
	 
	 
	 do:
	 	 
	 #while
	 
	 

elevar:
	
	
.data
	x: .word 0x1001008
	y: .word 10