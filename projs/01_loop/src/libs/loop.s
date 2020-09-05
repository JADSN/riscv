
# Descricao: 

.include "./src/libs/exit.s"
.include "./src/libs/print.s"

.align 1

.global init_loop
.type init_loop @function

.section .text

init_loop:
	li 	a0, 0
	li 	a1, 3
	add	t1, zero, a0
	addi	t2, a1, 1
	add	t3, zero, t1

exec_loop:
	call 	print
	add 	t3, t3, 1
	blt	t3, t2, exec_loop
	
	li	a0, 0	
	j	exit

