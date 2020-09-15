# Goal: Linux Syscall -- 64 -- write

# Prototype: ?

# Result: Writes payload

# Usage:
#       call stdwrite

# Observation: Maybe is necessary add ret after call this function

# Imports
.include "./src/file_descriptor.s"
.include "./src/linux_syscall.s"

# .align 1

# .global _start
# .type stdwrite, @function

# .section .text

stdwrite:
        # li      a0, FD_STDOUT # File Descriptor - (STDOUT)
        li      a7, SYS_WRITE # Linux Syscall -- write
        ecall   # Set Linux Syscall
