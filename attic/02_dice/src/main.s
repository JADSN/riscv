
# Descricao: 

.global _start

.text

exit:
	li	a0, 42
	li	a7, 93
	ecall

_start:
#	li	a0, 0x2A # a0 <- 42
	nop
	j	exit


