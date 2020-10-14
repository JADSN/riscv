
# Descricao: 

.align 1

.global _start

.equ SYS_WRITE, 64 # write
.equ SYS_EXIT,  93 # exit

.equ FD_STDOUT, 1
.equ FD_STDERR, 2


.section .text

print:
	# Armazenar caracter na stack
	li	t4, 65 # 'A'
	sb	t4, -1(sp)
	addi	t5, sp, -1
        li      a0, FD_STDOUT
        mv      a1, t5
        li      a2, 6 # Set string length 
        #li      a2, 1 # Set string length 
        li      a7, SYS_WRITE
        ecall
	# Imprime enter
	li	t4, 10 # '\n'
	sb	t4, -1(sp)
	addi	t5, sp, -1
        li      a0, FD_STDOUT
        mv      a1, t5
        li      a2, 6 # Set string length 
        #li      a2, 1 # Set string length 
        li      a7, SYS_WRITE
        ecall
        ret


init_loop:
	li 	a0, 0
	li 	a1, 3
	add 	t1, zero, a0 # count = 0 <- initial count loop
	addi 	t2, a1, 1 # count = a1 <- limit count loop
	add 	t3, zero, t1 # count = 0 <- contador

	#j exec_loop

exec_loop:
	# Impressao de tela
	call 	print	
	add t3, t3, 1  # Incrementar count	
  	blt t3, t2, exec_loop # a0 < a1	
	
	j exit

exit:
	li	a0, 0
	li	a7, 93
	ecall



_start:
	call	init_loop
