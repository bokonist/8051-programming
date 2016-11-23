; Sawtooth wave generation using DAC interfacing

START:	MOV DPTR, #FFC0; address of device
		MOV A, #00; set a as 00.
		MOV @DPTR, A; send to external device.
		INC A; increment A. when it reaches FF, when incremented, it'll go back to 00.
		SJMP START; repeat all over again