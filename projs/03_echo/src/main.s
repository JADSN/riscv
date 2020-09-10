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
.include "./src/print.s"
.include "./src/putchar.s"

.align 1

.global _start

.section .text

_start:
        # Procedure Call
        # Params:
        #       la a1, base_address -- a1: Base address
        #       li a2, 0~255 -- a2: string length

        la      a1, msg_01 # -- a1: Set base address
        li      a2, 12 # -- a2: Set string length
        call    print

        # Procedure Call
        # Params:
        #       la a1, base_address -- a1: Base address
        #       li a2, 0~255 -- a2: string length

        la      a1, msg_02 # -- a1: Set base address
        li      a2, 5 # -- a2: Set string length
        call    print

        # Procedure Call
        # Params:
        #       la a1, base_address -- a1: Base address

        la      a1, msg_03 # -- a1: Set base address
        call    putchar

        # Procedure Call
        # Params:
        #       la a1, base_address -- a1: Base address

        la      a1, msg_enter # -- a1: Set base address
        call    putchar

        # Procedure Call
        # Params:
        #       a0 - status code
        li      a0, 0
        call    exit

# Data section -- labels
.section .rodata
        msg_01: .string "Hello World\n"
        msg_02: .string "ASDF\n"
        msg_03: .string "A"
        msg_enter: .string "\n"
