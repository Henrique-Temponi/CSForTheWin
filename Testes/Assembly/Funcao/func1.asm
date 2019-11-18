# fazer uma funcao normal, receber um numero e somar com o proximo
#
# 


.text

.globl main

main:
	addi $t0, $zero, 0x1001		#
	sll $t0, $t0, 16		#
	
	lw $a0, 0($t0)			#
	lw $a1, 4($t0)			#
	
	jal func
	
	sw $v0, 8($t0)			#
	j fim		
	
	
func:
	add $v0, $a0, $a1
	jr $ra
	

fim:
	
.data
	x: .word 10
	y: .word 10
