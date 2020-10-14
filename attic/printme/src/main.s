
# Descricao: 

.align 1

.global _start

.equ SYS_WRITE, 64 # write
.equ SYS_EXIT,  93 # exit

.equ FD_STDOUT, 1
.equ FD_STDERR, 2


.section .text

exec_init:
	li 	a3, 0
	li 	a4, 3
	add 	t1, zero, a3
	addi 	t2, a4, 1
	add 	t3, zero, t1 

	j 	exec_loop

print:
	li 	a0, FD_STDOUT
	la 	a1, someword
	li 	a2, 1
	li 	a7, SYS_WRITE
	ecall
	ret	

exec_loop:
	add	t3, t3, 1
	call 	print
	blt 	t3, t2, exec_loop

	j 	exit

exit:
	li a7, SYS_EXIT
	ecall

_start:
	j	print
	#j	exec_init
	ecall

.data
	someword: .asciz "0x2b"
