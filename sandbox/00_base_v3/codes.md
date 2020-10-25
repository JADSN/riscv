# Codes

# putchar V1

```s

    # Chamada de procedimento

	# putchar

	# PRÓLOGO
	addi		sp, sp, -8  # Aloca espaço na stack (1 x 8 Bytes)
	sd			ra, 0(sp) # Armazena ra na stack

	# FUNÇÃO - INÍCIO

	# Variáveis locais (t1)
	# mv			t1, a0 # a0 - Define o 1° parametro
	li		a0, 0x41 # 'A' - Define o 1ª parâmetro

	sh      	a0, -1(sp) # Armazena 1Byte na stack

	addi    	t2, sp, -1 # Aloca 1Byte na stack
    li      	a0, FD_STDOUT # Define o file descriptor

	mv			a1, t2 # Obtêm o valor do enderaço contido na stack

	li      	a2, 1 # Define o tamanho da string

    li      	a7, SYS_WRITE # Chamada de sistema -> 64 - write
	ecall

	# FUNÇÃO - FIM

	# EPÍLOGO
	ld			ra, 0(sp) # Armazena ra na stack
	addi		sp, sp, 8  # Aloca espaço na stack (1 x 8 Bytes)

	# Chamada de procedimento
	# Sai do programa
	# TODO: mudar de li para mv ao definir a0
	li		a0, 0 # Define o código de sucesso
	li      a7, SYS_EXIT # Define o código da chamada de sistema
	ecall

```