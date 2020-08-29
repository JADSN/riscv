
# Descricao: 

.global _start

.text

.include "./src/exit.s"
.include "./src/soma.s"
.include "./src/subtracao.s"
.include "./src/multiplicacao.s"

_start:
	jal	hello
	li	a0, 44
	li 	a1, 1  
	jal	soma # a0 <- 45
	li	a1, 3 
	jal	subtracao # a0  <- 42
	li	a1, 2 
	jal	multiplicacao  # a0  <- 84
	j	exit

hello: 
	li    a0, 1          # File descriptor (1 - stdout | 2 - stderr)
	#li    a0, 2          # File descriptor (1 - stdout | 2 - stderr)
        la    a1, helloworld # load address of helloworld
        li    a2, 12         # length of our string
        li    a7, 64         # linux write system call
        ecall                # Call linux to output the string
	ret

.data
helloworld:      .asciz "La Bolicha!\n"
