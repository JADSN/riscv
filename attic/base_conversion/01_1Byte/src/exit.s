exit:
	li	a0, 0 # Define o código de sucesso
	li	a7, SYS_EXIT # Define o codigo da chamada de sistema
	ecall
