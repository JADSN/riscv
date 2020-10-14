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

# Goal - Show the number of arguments in terminal

.global _start

_start:

    # Procedure call
    # Description: Show the number of arguments in terminal
    # Interface: fn echo_argc(usize) -> usize {}
    
    lb  t1, 0(sp) # Carrega o valor do argc da stack
    mv  a0, t1 # Retorna o resultado da função
    #ret

    # Procedure call
    # Description: Exit program
    # Interface: fn echo_exit() -> usize {}

    li a7, 93 # Define system call
    ecall
    