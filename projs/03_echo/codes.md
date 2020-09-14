# Codes

```s

# ----------------------------------------------

# Description: Show 'Hello World \n' in terminal
# Procedure Call
# Params:
#       la a1, base_address -- a1: Base address
#       li a2, 0~255 -- a2: string length
la      a1, msg_01 # -- a1: Set base address
li      a2, 12 # -- a2: Set string length
call    print

# ----------------------------------------------
# Description: Show 'ASDF' in terminal
# Procedure Call
# Params:
#       la a1, base_address -- a1: Base address
#       li a2, 0~255 -- a2: string length
la      a1, msg_02 # -- a1: Set base address
li      a2, 5 # -- a2: Set string length
call    print

# ----------------------------------------------
# Description: Show 'A' character in terminal
# Procedure Call
# Params:
#       la a1, base_address -- a1: Base address
la      a1, msg_03 # -- a1: Set base address
call    putchar

# ----------------------------------------------
# Description: Show '\n' in terminal
# Procedure Call
# Params:
#       la a1, base_address -- a1: Base address
la      a1, msg_enter # -- a1: Set base address
call    putchar

.section .rodata
        msg_01: .string "Hello World\n"
        msg_02: .string "ASDF\n"
        msg_03: .string "A"
        msg_enter: .string "\n"


```