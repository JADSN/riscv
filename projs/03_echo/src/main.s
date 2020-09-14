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

.include "./src/exit.s"

.align 1

.global _start

.section .text

.include "./src/puts.s"

_start:
        # ----------------------------------------------
        # Procedure Call - puts
        # Params:
        #       a1 - Base address from stack (section rodata)
        la      a1, char_1
        call    puts

        # ----------------------------------------------
        # Description: Exit program
        # Procedure Call
        # Params:
        #       a0 - status code
        li      a0, 0
        call    exit

# Data section -- labels
.section .rodata
        char_1: .string "A"
        # enter: .string "\n"
