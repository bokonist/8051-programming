; decimal to hex conversion
; i/p: [4200]=03, [4201]=06. (convert 36 to equivalent hex)
		MOV DPTR,#4200 ; MSB of the decimal to be converted moved to DPTR. (in this case, 03)
		MOVX A,@DPTR ; move it to A
		MOV B, #OA ; the multiplier to convert to hex
		MUL AB ; multiply B with Accumilator. Product is in A. (product is 30dec , 0x1E hex)
		MOV B,A; move product to B
		INC DPTR; LSB of the decimal input.
		ADD A,B; add the units place to the accumilated result. no need for multipliers.
		INC DPTR; to store the result
		MOVX @DPTR,A; store the result
EXIT:	SJMP EXIT

; execute and check [4202] for result. in this case, 0x24