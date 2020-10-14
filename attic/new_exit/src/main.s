
# Descricao: 

.align 1

.global _start

.section .text


exit:
	#lb	a0, 0(sp)	
	#ld	a0, 0(sp)	
	#li 	a0, 256
#	li 	a0, 384 # Byte overflow <- 255
	#li 	a0, 347 # Byte overflow <- 255
	li 	a0, 379 # Byte overflow <- 255
	li	a7, 93 
	ecall

_start:
	call exit
