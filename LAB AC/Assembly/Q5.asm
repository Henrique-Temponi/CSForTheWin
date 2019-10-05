# x = 100000;
# y = 200000;
# z = x + y;
#
# x -> $s0
# y -> $s1
# z -> $s2

addi $t0, $zero, 100 # t0 = 1
sll $t0, $t0, 3  # Shift Left 5 bits ( 100 )
addi $t0, $t0, 000 # t0 = 1 # to = 100000

addi $t1, $zero, 2 # t1 = 2
sll $t1, $t1, 5  # Shift Left 5 bits ( 200000 )

add $s0, $zero, $t0 # x = 100000

add $s1, $zero, $t1 # y = 200000

add $s2, $s0, $s1   # z = x + y
