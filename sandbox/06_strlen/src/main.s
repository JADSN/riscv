.align 1

.global _start

.section .text

# Chamadas de sistemas Linux
.equ SYS_EXIT,  93 # Sai do programa
.equ SYS_WRITE, 64 # Escreve dado no terminal

# Linux File Descriptors (fd)
.equ FD_STDOUT, 1


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



init_loop:
	li		t3, 0 # Contador
	li		t4, 5 # Tamanho da string

	# li 	a0, 29
	# j		exit

loop:

	# Chamada de procedimento
	li		a0, 0x41 # 'A'
	call	putchar

	addi	t3, t3, 1 # Contador += 1
	blt		t3, t4, loop # Contador <= Tamanho da string (goto loop)


	# Chamada de procedimento
	li		a0, 0x42 # 'B'
	call	putchar

	j		loop_ret

loop_ret:
	mv		a0, t3
	ret
	# # Chamada de procedimento
	# li 		a0, 29
	# j		exit


_start:

	call	init_loop

	# Chamada de procedimento
	j		exit

# Sai do programa
exit:
	# li		a0, 42 # Define o código de sucesso
	li      a7, SYS_EXIT # Define o código da chamada de sistema
	ecall
