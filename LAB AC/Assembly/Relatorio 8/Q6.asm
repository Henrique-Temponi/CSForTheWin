# x = o maior inteiro possível;
# y = 300000;
# z =  x-4y
#
# x -> $s0
# y -> $s1
# z -> $s2

ori $t0, $t0, 0x7FFF	# t0 = 0x7fff
sll $t0, $t0, 16	# shift Left 16 bits
ori $s0, $t0, 0xFFFF	# t0 = 0xffff

ori $t0, $t0, 4		# t0 = 4 (hex)
sll $t0, $t0, 16	# Shift Left 16 bits
ori $s1, $t0, 0x93e0	# Adiciona o resto do numero (300000) em y

add $t0, $zero, $s1	# t0 = y
add $t0, $t0, $t0	# t0 = 2y
add $t0, $t0, $t0	# t0 = 4y

sub $s2, $s0, $t0	# z = x -4y