# primeiramente faca $8= 0x12345678.
# depois
# $9  = 0x12 
# $10 = 0x34
# $11 = 0x56
# $12 = 0x78

ori $t0, $zero, 0x1234	#
sll $t0, $t0, 16	#
ori $t0, $t0, 0x5678	# t0 ($8) = 12345678

srl $t1, $t0, 24	# t1 = 12

srl $t2, $t0, 16	#
and $t2, $t2, 0x00FF	# t2 = 34

sll $t3, $t0, 16	#
srl $t3, $t3, 24	# t3 = 56

sll $t4, $t0, 24	#
srl $t4, $t4, 24	# t3 = 56