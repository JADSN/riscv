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

.align 1

.global _start

.section .text


# # Goal: Show some message in terminal
# # Prototype: int printf(const * char restrict format, ...);
# # Usage: Writes a sequence of caracters in terminal
# echo_printf_1:
#         li      a0, 1 # File Descriptor - (STDOUT)
#         la      a1, msg_01 # Load base address from stack
#         li      a2, 12 # Set string length
#         li      a7, 64 # Linux Syscall -- write
#         ecall
#         ret

# echo_printf_2:
#         li      a0, 1 # File Descriptor - (STDOUT)
#         la      a1, msg_02 # Load base address from stack
#         li      a2, 5 # Set string length
#         li      a7, 64 # Linux Syscall -- write
#         ecall
#         ret

_start:
        # GOAL: Show "Hello World\n" in terminal -- Hardcoded

        # Procedure Call
        # li      a0, 1 # File Descriptor - (STDOUT)
        # la      a1, msg_01 # Load base address from stack
        # li      a2, 12 # Set string length
        # li      a7, 64 # Linux Syscall -- write
        # ecall

        # call echo_printf_1

        # # Procedure Call
        # # li      a0, 1 # File Descriptor - (STDOUT)
        # # la      a1, msg_02 # Load base address from stack
        # # li      a2, 5 # Set string length
        # # li      a7, 64 # Linux Syscall -- write
        # # ecall
        # call echo_printf_2

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
        #       a0 - status code
        li      a0, 0
        call    exit

# Data section -- labels
.section .rodata
        msg_01: .string "Hello World\n"
        msg_02: .string "ASDF\n"
