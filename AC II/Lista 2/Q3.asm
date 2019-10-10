# x = 3;
# y = x * 1025 ;
#
# x -> $s0
# y -> $s1

addi $s0, $zero, 3	# x = 3

add $t0, $zero, $s0	# t0 = x
add $t0, $t0, $t0	# t0 = 2x
add $t0, $t0, $t0	# t0 = 4x
add $t0, $t0, $t0	# t0 = 8x
add $t0, $t0, $t0	# t0 = 16x
add $t0, $t0, $t0	# t0 = 32x
add $t0, $t0, $t0	# t0 = 64x
add $t0, $t0, $t0	# t0 = 128x
add $t0, $t0, $t0	# t0 = 256x
add $t0, $t0, $t0	# t0 = 521x
add $t0, $t0, $t0	# t0 = 1024x

add $s1, $t0, $s0	# t0 = 1025x