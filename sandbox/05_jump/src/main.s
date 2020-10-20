#       C A L L I N G      C O N V E N T I O N
#       --------------------------------------
#
# ABI Name | Description                        | Saver
# ======================================================
#   ra     | Return address                     | CALLER
#   t0     | Alternate link register (C)        | CALLER
#   t1-t2  | Temporary register (t0: ?)         | CALLER
#   t3-t6  | Temporary registers                | CALLER
#   a0-a1  | Function arguments / Return values | CALLER
#   a2-a7  | Function arguments                 | CALLER
# ---------+------------------------------------+-------
#   sp     | Stack pointer                      | Callee
#   s0/fp  | Frame pointer                      | Callee
#   s1     | Callee-saved register              | Callee
#   s2-s11 | Callee-saved registers             | Callee

.align 1

.global _start

.section .text

# File descriptors
.equ FD_STDOUT, 1
.equ FD_STDERR, 2

# Chamadas de sistemas Linux
.equ SYS_WRITE, 64 # Escreve dado no terminal
.equ SYS_EXIT,  93 # Sai do programa


exit:
	# li		a0, 0 # Define o código de sucesso
	li		a7, SYS_EXIT # Define o codigo da chamada de sistema
	ecall

function_a:
	li		a0, 32
	call	exit


_start:
	j		function_a
	j		exit

