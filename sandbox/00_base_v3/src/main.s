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

.include "./src/file_descriptors.s"
.include "./src/linux_syscalls.s"
.include "./src/putchar.s"
.include "./src/exit.s"

_start:
	# Chamada de Procedimento
	li 		a0, 0x41 # a0 = 'A'
	call	putchar

	j		exit

