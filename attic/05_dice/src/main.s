
# Descricao: 

.global _start

.text



exit:
#	li	a0, 42
	li	a7, 93
	ecall

multiplicacao:
	mul 	a0, a0, a1
	ret

subtracao:
	sub 	a0, a0, a1
	ret

soma:
	add	a0, a0, a1
	ret

_start:
	li 	a0, 44
	li	a1, 1 
	jal	soma # a0 <- 45
	#li	t0, soma
	li	a1, 3
	jal	subtracao # a0 <- 42
	li	a1, 2
	jal	multiplicacao # a0 <- 84
#	li	a0, 0x2A # a0 <- 42
	j	exit

