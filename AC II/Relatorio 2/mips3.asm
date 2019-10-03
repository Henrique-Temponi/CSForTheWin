# 3)
# x = 3;
# y = x * 1025 = 1024x + x;
#
# x -> $s0
# y -> $s1

addi $s0, $zero, 3
add $s1, $s0, $s0
add $s1, $s1, $s1
add $s1, $s1, $s1
add $s1, $s1, $s1
add $s1, $s1, $s1
add $s1, $s1, $s1
add $s1, $s1, $s1
add $s1, $s1, $s1
add $s1, $s1, $s1
add $s1, $s1, $s1
add $s1, $s1, $s0