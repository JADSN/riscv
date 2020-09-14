# Goal: Show a characted and append `\n` in terminal

# Prototype: int puts(const char *s);

# Result: The puts function writes the string pointed to by s to the stream pointed to by stdout,
# and appends a new-line character to the output. The terminating null character is not
# written.


# Usage:
#       la a1, "A" # -- a1: Base address (section rodata)
#       call    puts

# Imports
.include "./src/file_descriptor.s"
.include "./src/linux_syscall.s"
.include "./src/putchar.s"


# Description: Puts implementation
puts:
        # # Local Variables (t1)
        # mv      t1, a1 # a1 -- Load base address from stack

        li      a0, FD_STDOUT # File Descriptor (STDOUT)
        mv      a1, a1 # Load base address from stack
        li      a2, 1 # Set string length
        li      a7, SYS_WRITE # Linux Syscall - write
        ecall

        # Usage:
        # mv      a1, a1 # -- a1: Base address
        # call    putchar
        # ret
        # ret

        # TODO: Irá utilizar o putchar
        li      a0, FD_STDOUT # File Descriptor (STDOUT)
        la      a1, enter # Load base address from stack
        li      a2, 1 # Set string length
        li      a7, SYS_WRITE # Linux Syscall - write
        ecall
        ret

        # Usage:
        #       la      a1, "A" # -- a1: Base address
        #       call    putchar
        # la      a1, enter # -- a1: Base address
        # call    putchar

        # call    stdwrite
        # ret


# Data section -- labels
.section .rodata
        enter: .string "\n"
