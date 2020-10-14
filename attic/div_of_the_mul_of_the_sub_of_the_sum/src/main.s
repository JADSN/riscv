
# Descricao: 

.global _start

.text

.include "./src/exit.s"
.include "./src/soma.s"
.include "./src/subtracao.s"
.include "./src/multiplicacao.s"
.include "./src/division.s"

_start:
	jal	hello
	li	a0, 100
	li 	a1, 10
	jal	soma # a0 <- 110
	li	a1, 10 
	jal	subtracao # a0  <- 100
	li	a1, 2 
	jal	multiplicacao  # a0  <- 200
	li	a1, 2
	jal	division # a0 <- 100
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
