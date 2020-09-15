# Goal: Show some message in terminal

# Prototype: int print(const * char restrict format, ...);

# Result: Writes message in terminal defined in base address (a1)

# Usage:
#       la a1, "Hello World\n" # -- a1: Base address
#       li a2, 12 # -- a2: Set string length (0~255)
#

# Imports
.include "./src/file_descriptor.s"
.include "./src/linux_syscall.s"

# .align 1

# .global print
# .type print, @function

# .section .text

print:
        # Local Variables (t1, t2)
        mv      t1, a1 # -- t1: Base address
        mv      t2, a2 # -- t2: String length

        li      a0, FD_STDOUT # File Descriptor - (STDOUT)

        mv      a1, t1 # Load base address from stack
        # mv a1, a1 # Same thing as without line 18

        mv      a2, t2 # Set string length
        # mv a2, a2 # Same thing as without line 19

        li      a7, SYS_WRITE # Linux Syscall -- write
        ecall
        ret
