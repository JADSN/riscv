# Goal: Show some character in terminal

# Prototype: int putchar(int c);

# Result: Returns the character written. If a write error occurs, the error
# indicator for the stream is set and putchar returns EOF.

# Usage:
#       la a1, "A" # -- a1: Base address
#

# Imports
.include "./src/file_descriptor.s"
.include "./src/linux_syscall.s"

putchar:
        # Local Variables (t1)
        mv      t1, a1 # -- t1: Base address

        li      a0, FD_STDOUT # File Descriptor - (STDOUT)

        mv      a1, t1 # Load base address from stack
        # mv a1, a1 # Same thing as without line 18

        li      a2, 1 # Set string length

        li      a7, SYS_WRITE # Linux Syscall -- write
        ecall
        ret
