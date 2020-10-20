# Module: exit

# Interface:
	# #include <stdlib.h>
	# void exit(int status);

# Description
	# 1. The exit function causes normal program termination to occur. If more than one call to
	# the exit function is executed by a program, the behavior is undefined.

	# 2. Control is returned to the host environment. If the value of status is zero or
	# EXIT_SUCCESS, an implementation-defined form of the status successful termination is
	# returned. If the value of status is EXIT_FAILURE, an implementation-defined form
	# of the status unsuccessful termination is returned. Otherwise the status returned is
	# implementation-defined

# Usage
    # call    exit

exit:
	li		a0, 0 # Define o código de sucesso
	li      a7, SYS_EXIT # Define o codigo da chamada de sistema
	ecall
