.global _start

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


# Prototipo: fn soma(usize) -> usize {}
# Descricao: Recebe um valor e soma + 1
soma:
	mv	t1, a0 # Salva o 1o parametro

	#addi	a0, a0, 1
	addi	t2, t1, 1 # t2 <- t1 + 1
	mv	a0, t2 # Retorna o resultado da funcao
	ret

# Prototipo: fn echo_exit(usize) {}
# Descricao: Termina o programa
echo_exit:
	#mv	t1, a0 # Salva o 1o parametro

	# Chamada de procedimento
	#mv	a0, t1 # Define o 1o parametro da proxima
		       # funcao a ser chamada.

	#mv	a0, a0 # Repassa o parametro a0 como argumento
		       # para proxima funcao

	li	a7, 93 # Define o codigo da chamada de sistema
	ecall

# Prototipo: fn get_argc() -> usize {}
# Descricao: Retorna o numero de argumentos
get_argc:
	ld	t1, 0(sp) # Carrega o valor do argc da stack
	mv	a0, t1 # Retorna o resultado da funcao
	ret

_start:
	li	t1, 77
	# Chamada de procedimento
	call	get_argc
	#mv	t1, a0 # Salva o resultado de get_argc para t1

	# Chamda de procedimento
	#mv	a0, t1 # Define o 1o parametro da proxima
		       # funcao a ser chamada.
	call	soma
	#mv 	t2, a0 # t2 <- soma(x)

	# Chamada de procedimento
	#mv	a0, t2 # Define o 1o parametro da proxima
		       # funcao a ser chamada.

	call 	echo_exit
