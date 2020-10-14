# Descricao: 
# - Exit program

.include "./src/constants/linux_syscalls.s"

.align 1

.section .text

exit:
	li	a7, SYS_EXIT 
	ecall

