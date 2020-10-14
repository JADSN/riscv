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


# Goal Exit program -- Module


# .include "./src/file_descriptor.s"
# .include "./src/linux_syscall.s"

.include "./src/putchar.s"

# .include "./src/puts.s"

.include "./src/exit.s"


# .align 1

.global _start

.section .text

# exit
# putchar
# strlen
# puts


_start:
        



        # ----------------------------------------------
        # Procedure Call
        # Description: print_msg
        li      a0, 72 # 'H'
        call    putchar

        # ----------------------------------------------
        # Procedure Call
        # Description: print_msg
        li      a0, 101 # 'e'
        call    putchar

        # ----------------------------------------------
        # Procedure Call
        # Description: print_msg
        li      a0, 108 # 'l'
        call    putchar

        # ----------------------------------------------
        # Procedure Call
        # Description: print_msg
        li      a0, 108 # 'l'
        call    putchar

        # ----------------------------------------------
        # Procedure Call
        # Description: print_msg
        li      a0, 111 # 'o'
        call    putchar

        # ----------------------------------------------
        # Procedure Call
        # Description: print_msg
        li      a0, 32 # ' '
        call    putchar

        # ----------------------------------------------
        # Procedure Call
        # Description: print_msg
        li      a0, 119 # 'w'
        call    putchar

        # ----------------------------------------------
        # Procedure Call
        # Description: print_msg
        li      a0, 111 # 'o'
        call    putchar

        # ----------------------------------------------
        # Procedure Call
        # Description: print_msg
        li      a0, 114 # 'r'
        call    putchar

        # ----------------------------------------------
        # Procedure Call
        # Description: print_msg
        li      a0, 108 # 'l'
        call    putchar

        # ----------------------------------------------
        # Procedure Call
        # Description: print_msg
        li      a0, 100 # 'd'
        call    putchar

        # ----------------------------------------------
        # Procedure Call
        # Description: print_msg
        li      a0, 33 # '!'
        call    putchar

        # ----------------------------------------------
        # Procedure Call
        # Description: print_msg
        li      a0, 10 # '\n'
        call    putchar

        # ----------------------------------------------
        # Procedure Call
        # Description: Exit function
        # Params:
        #       a0 - status code
        li      a0, 0
        call    exit
