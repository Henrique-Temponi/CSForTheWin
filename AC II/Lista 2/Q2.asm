# x = 3;
# y = x * 4 ;
#
# x -> $s0
# y -> $s1

addi $s0, $zero, 3	# x = 3

add $t0, $zero, $s0	# t0 = x
add $t0, $t0, $t0	# t0 = 2x

add $s1, $t0, $t0	# y = 4x
