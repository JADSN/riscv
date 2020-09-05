
# Descricao: 

.include "./src/libs/loop.s"

.align 1

.global _start

.section .text

_start:
	lb a0, 0(sp)
	li a0, 42
	call init_loop 

