
# Descricao: 

.global _start

.text



exit:
#	li	a0, 42
	li	a7, 93
	ecall

soma:
	mv	t0, a0 # Salva o valor do a0
	mv	t1, a1 # Salva o valor do a1
	add 	a0, t0, t1
	ret

_start:
	li	a0, 44
	li 	a1, 2  
	jal	soma
	j	exit
