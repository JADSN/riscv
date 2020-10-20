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

.include "./src/file_descriptor.s"
.include "./src/linux_syscalls.s"
.include "./src/exit.s"

.align 1

.global _start

.section .text

_start:

	li		a0, 0x44434241 # 'ABCD' - Define o 1° parametro

    sw      a0, -4(sp) # Armazena 2Bytes na stack

	addi    t1, sp, -4 # Aloca 2Bytes na stack
    li      a0, FD_STDOUT # Define o file descriptor

	mv		a1, t1 # Obtêm o valor do enderaço contido na stack

	li      a2, 4 # Define o tamanho da string

    li      a7, SYS_WRITE # Chamada de sistema -> 64 - write
    ecall

	# Chamada de Procedimento
	call exit
