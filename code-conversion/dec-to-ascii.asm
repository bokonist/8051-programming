; Decimal to ASCII conversion
; i/p [4500]= 3 (convert this to corresponding ASCII. 3 will become 33hex)
		MOV DPTR, #4500; point DPTR to input
		MOVX A, @DPTR; move it to accumilator
		CLR C; clear carry bit
		SUBB A, #0A; subtract 10 to check if it was a valid decimal
		JNC SET; the above step will set a carry(borrow) if the result was -ve. -ve means decimal was valid. if invalid, i.e. no borrow set, jump to SET.
		ADDC A, #0A; restore the decimal to original value.
		MOV B, #30; ascii value of '0' moved to B
		ADD A,B; add it to A
		SJMP STR; jump to STR store step.
SET:	MOV A,#0F; set failure. 
STR:	MOV DPTR, #4501; point to result addr
		MOVX @DPTR, A; store result
EXIT:	SJMP EXIT; halt

; execute the code. result in [4501]. 0F means failure. in this case, the result is 33hex.