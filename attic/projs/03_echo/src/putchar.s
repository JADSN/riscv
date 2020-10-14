# Goal: Show some character in terminal

# Prototype: int putchar(int c);

# Result: Returns the character written. If a write error occurs, the error
# indicator for the stream is set and putchar returns EOF.

# Usage:
#       li      a0, 65 # 'A'
#       call    putchar

# Imports
.include "./src/file_descriptor.s"
.include "./src/linux_syscall.s"

# .align 1

# .global putchar
# .type putchar, @function

.section .text

# a0 - char
putchar:
        # Local Variables (t1)
        mv      t1, a0 # Recebendo o primeiro parâmetro - (character)

        # Enviroment Call

        li      a0, FD_STDOUT # File Descriptor - (STDOUT)

        addi    t2, sp, -1 # Aloca um Byte na stack
        sb      t1, -1(sp) # Salva caracter (1 Byte) na stack - MÉTODO 1
        # sb      t1, (t2) # Salva caracter (1 Byte) na stack - MÉTODO 2

        mv      a1, t2 # Define o endereço da string no a1

        li      a2, 1 # Set string length

        li      a7, SYS_WRITE # Linux Syscall -- write
        ecall

        ret
