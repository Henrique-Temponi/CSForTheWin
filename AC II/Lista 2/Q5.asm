# x = 305419896
#
# x -> $s0

addi $t0, $zero, 0x1234		# adiciona a primeira parte do numero
sll $t0, $t0, 16		# move a primeira parte pada a direita, para a segunda poder entrar
addi $s0, $t0, 0x5678		# adiciona a segunda parte 