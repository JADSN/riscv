
# Descricao: 

.global _start

.text

.include "./src/exit.s"
.include "./src/soma.s"

_start:
	li	a0, 44
	li 	a1, 2  
	jal	soma
	j	exit
