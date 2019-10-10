# x = 100000;
# y = 200000
# z = x + y
#
# x -> $s0
# y -> $s1
# z -> $s2

addi $t0, $zero, 1 	# t0 = 1 (hex)
sll $t0, $t0, 16   	# Shift Left 16 bits 
ori $s0, $t0, 0x86A0	# Adicionar o resto do valor de 100000 em x

addi $t0, $zero, 3	# t0 = 3 (hex)
sll $t0, $t0, 16   	# Shift Left 16 bits 
ori $s1, $t0, 0x0D40	# Adicionar o resto do valor de 200000 em x

add $s2, $s1, $s0	# z = x + y