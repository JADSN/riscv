.align 1

.global _start

.section .text

# Chamadas de sistemas Linux
.equ SYS_EXIT,  93 # Sai do programa
.equ SYS_WRITE, 64 # Escreve dado no terminal

# Linux File Descriptors (fd)
.equ FD_STDOUT, 1

_start:
	# Chamada de procedimento
	# Sai do programa
	li		a0, 0 # Define o código de sucesso
	li      a7, SYS_EXIT # Define o código da chamada de sistema
	ecall

