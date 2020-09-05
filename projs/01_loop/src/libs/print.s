
# Descricao: 

.include "./src/constants/file_descriptor.s"
.include "./src/constants/linux_syscalls.s"

.align 1

.global print
.type print @function

.section .text

print:
	li 	t5, 65
	sb	t5, -1(sp)
	addi	t6, sp, -1
	li	a0, FD_STDOUT
	mv 	a1, t6
	li	a2, 1
	li	a7, SYS_WRITE
	ecall
	ret

