;Blinky.asm by ayden hello this is my first 8051 assembly file 
$MODLP51

org 0000H
	ljmp myprogram
	
WaitHalfSec:
	mov R2, #89
L3: mov R1, #250
L2: mov R0, #166
L1: djnz R0, L1
	djnz R1, L2
	djnz R2, L3
	ret
	
myprogram:
	mov SP, #7FH
M0:
	cpl P3.7
	lcall WaitHalfSec
	sjmp M0
END