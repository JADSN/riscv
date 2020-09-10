# Goal: Causes normal program termination to occur.
# Prototype: void(int status);
# Result: Show 0 when occurs success and 1 when occurs failure.
# Usage:
#       li a0, status_code(int)
#       call exit

# Imports
.include "./src/linux_syscall.s"

exit:
        # Local Variables (t1)

        # mv t1, a0 # Obtain 1° parameter (status code)
        # mv a0, t1

        # Lines 18 -- Same thing of lines 14-15
        # mv a0, a0 # Pass parameter a0 as an argument
        #           # for next function

        li a7, SYS_EXIT # Linux Syscall -- exit
        ecall
        ret
