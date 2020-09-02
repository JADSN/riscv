
# Descricao: 

.global _start

.text

exit:
#	li	a0, 42
	li	a7, 93
	ecall

#sqrt_root:
#	fsqrts	a0, a0, 1
#	ret	

#division:
#	fdiv.s	a0, a0, a1
#	ret 

#multiplicacao:
#	fmul.s 	a0, a0, a1
#	ret

#subtracao:
#	fsub.s 	a0, a0, a1
#	ret

#soma:
#	fadd.s	a0, a0, a1
#	ret

_start:
	li 	a0, 100
	li	a1, 10 
	beq	a0, a1, 109 
	#fadd.s	fa0, fa0, fa1
	#fsqrt.d fa0, fa0, fa1
#	jal	soma # a0 <- 110
	#li	t0, soma
	#li	a1, 10
	#jal	subtracao # a0 <- 100
	#3li	a1, 2
	#jal	multiplicacao # a0 <- 200
	#li	a1, 2
	#jal	division  # a0 <- 100
#	jal	sqrt_root # a0 <- 10
#	li	a0, 0x2A # a0 <- 42
	j	exit

