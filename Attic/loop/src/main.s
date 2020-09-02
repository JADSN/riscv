
# Descricao: 

.global _start

.text

li a0, 0
li a1, 3

init_loop:
	add t1, zero, a0 # count = 0 <- initial count loop
	addi t2, a1, 1 # count = a1 <- limit count loop
	add t3, zero, t1 # count = 0 <- contador

	j exec_loop

exec_loop:
	add t3, t3, 1  # Incrementar count	
  	blt t3, t2, exec_loop # a0 < a1	
	
	j exit

exit:
	li	a7, 93
	ecall



_start:
	j	init_loop
	j	exit
