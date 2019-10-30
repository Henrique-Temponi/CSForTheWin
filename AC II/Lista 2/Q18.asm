# Escreva um programa que solicite ao usuário que digite dois números,
# seu programa deverá conter uma função que receba esses dois números e retorne o primeiro elevado ao segundo.
# Esse resultado deverá ser mostrado na tela. O programa rodará indefinidamente até que o primeiro número digitado seja 0 (zero).
# Obs.: Caso você não tenha visto a utilização de handlers e a leitura de valores pelo teclado,
#  os dois números deverão ser lidos da primeira e segunda posição livre da memória.
#  O resultado será escrito na terceira posição livre da memória e o programa irá executar apenas uma vez.
#
#
#


.text
.globl main

main:

	addi $t0, $zero, 0x1001		#
	sll $t0, $t0, 16		# pegar endereco
	
	lw $a0, 0($t0)			# carregar o primeiro valor
	lw $a1, 4($t0)			# carregar o segundo valor
	
	jal func
	
	sw $v0, 8($t0)			#
	j fim
	
	
	func:
	
		addi $t1, $zero, 1	#
	
	do:
	
		mult $t1, $a0		#
		mflo $t1		#
		
		
		addi $a1, $a1, -1	#
		
		bne $a1, $zero, do
		
	add $v0, $zero, $t1	#	
	jr $ra
		

	fim:
	
.data

	a: .word 2
	b: .word 5
	c: .word -1