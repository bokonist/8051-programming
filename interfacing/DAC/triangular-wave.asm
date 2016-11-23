; Triangular wave generation using DAC interfacing

		MOV DPTR, #FFC0; address of device
		MOV A, #00; set a as 00.
		MOV @DPTR, A; send to external device.
l1:		INC A; increment A. 
		MOV @DPTR, A; send to external device.
		CJNE A, #FF,l1; keep incrementing till FF.
l2:		DEC A; decrement A.
		MOV @DPTR, A; send to external device.
		CJNE A, #00, l2; keep deccrementing till 00
		SJMP l1; repeat all over again