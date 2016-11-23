; Interfacing with stepper motor
;I/P is [4500]:09 [4501]:05 [4502]:06 [4503]:0A //these are called control words

START:	MOV DPTR, #4500; get first input
		MOV R0, #04; 4 control words in input
LAB2:	MOVX A,@DPTR; move input(control word) to A
		PUSH DPH; push the high bits of DPTR to stack
		PUSH DPL; push the low bits og DPTR to stack
		MOV DPTR, #FFC0; move the address of interface, FFC0 to DPTR
		ACALL DELAY; call delay subroutine
		MOVX @DPTR, A; send control word to external device.
		POP DPL; pop stack and store in DPL
		POP DPH; pop stack and store in DPH
		INC DPTR; next control word.
		DJNZ R0,LAB2; exhaust all 4 control words
		SJMP START; start again with the first input.

DELAY:	MOV R2, #64; for delays
H1:		MOV R3, #FF; delays
H2:		DJNZ R3, H2;
		DJNZ R2, H1;
		RET;