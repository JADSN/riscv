# Module: putchar - C99. P.311

# Interface:
	# #include <stdio.h>
    # int puts(const char *s);

# Description
	# 1. The putchar function returns the character written. If a write error occurs, the error
    #    indicator for the stream is set and putchar returns EOF.

# Usage
    # Chamada de Procedimento
	# li 		a0, 0x41 # a0 = 'A' - Character (1 Byte)
	# call	putchar

.align 1

.section .text

# 1º Param: a0 -caractere (1 Byte)
putchar:
	# PRÓLOGO
	addi		sp, sp, -8  # Aloca espaço na stack (1 x 8 Bytes)
	sd			ra, 0(sp) # Armazena ra na stack

	# FUNÇÃO - INÍCIO

	# Variáveis locais (t1)
	mv			t1, a0 # a0 - Define o 1° parâmetro

	sb      	a0, -1(sp) # Armazena o 1º parâmetro na stack (1 Byte)

	addi    	t2, sp, -1 # Aloca 1Byte na stack
    li      	a0, FD_STDOUT # Define o file descriptor

	mv			a1, t2 # Obtêm o valor do endereço contido na stack

	li      	a2, 1 # Define o tamanho da string

    li      	a7, SYS_WRITE # Chamada de sistema -> 64 - write
	ecall

	# FUNÇÃO - FIM

	# EPÍLOGO
	ld			ra, 0(sp) # Armazena ra na stack
	addi		sp, sp, 8  # Aloca espaço na stack (1 x 8 Bytes)
	ret
