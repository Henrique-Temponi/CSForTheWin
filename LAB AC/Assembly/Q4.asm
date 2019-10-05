# x = 3;
# y = 4 ;
# z = ( 15*x + 67*y)*4
#
# x -> $s0
# y -> $s1
# z -> $s2

addi $s0, $zero, 3 # x = 3
addi $s1, $zero, 4 # y = 4

sll $t0, $s0, 4   # Shift Left 4 bits ( 16x )
sub $t0, $t0, $s0 # 15x 

sll $t1, $s1, 6   # Shift Left 6 bits ( 64y )
add $t1, $t1, $s1 # 65y
add $t1, $t1, $s1 # 66y
add $t1, $t1, $s1 # 67y

add $t2, $t0, $t1 # (15x + 67y)

sll $s2, $t2, 2   # Shift Left 2 bits ( 4 )