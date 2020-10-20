# Codes

## PUTCHAR

```s

	# li		a0, 65 # 'A' - Define o 1° parametro

    # sb      a0, -1(sp) # Armazena 1Byte na stack

	# addi    t2, sp, -1 # Aloca 1Byte na stack
    # li      a0, FD_STDOUT # Define o file descriptor

	# mv		a1, t2 # Obtêm o valor do enderaço contido na stack

	# li      a2, 1 # Define o tamanho da string

    # li      a7, SYS_WRITE # Chamada de sistema -> 64 - write
	# ecall

```