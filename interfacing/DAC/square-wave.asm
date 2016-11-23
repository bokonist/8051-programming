; Square wave generation using DAC interfacing

START:	MOV DPTR, #FFC0; address of device
		MOV A, #00; set a as 00.
		MOV @DPTR, A; send to external device.
		LCALL DELAY; wait a bit. call delay subroutine.
		MOV A, #FF; set A as FF.
		MOVX @DPTR, A; send to external device
		LCALL DELAY; wait a bit.
		SJMP START; repeat all over again


DELAY:	MOV R2, #64; for delays
H1:		MOV R3, #FF; delays
H2:		DJNZ R3, H2;
		DJNZ R2, H1;
		RET;