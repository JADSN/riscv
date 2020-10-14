
# Descricao: 

.global _start

.text

exit:
#	li	a0, 42
	li	a7, 93
	ecall

division:
	div	a0, a0, a1
	ret 

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
	li 	a0, 100
	li	a1, 10 
	jal	soma # a0 <- 110
	#li	t0, soma
	li	a1, 10
	jal	subtracao # a0 <- 100
	li	a1, 2
	jal	multiplicacao # a0 <- 200
	li	a1, 2
	jal	division  # a0 <- 100
#	li	a0, 0x2A # a0 <- 42
	j	exit

