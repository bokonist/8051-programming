; ASCII to decimal conversion.

		MOV	DPTR, #4500 ; address to store result in
		MOV A, #36 ; the ascii value. (36hex). we're gonna convert it to 6dec
		SUBB A,#30 ; subtract_with_borrow the ascii value of '0' i.e. 30hex from A.
		CLR C; clear carry
		SUBB A, #0A; subtract_with_borrow the value 10dec from A to check if the result is a decimal.
		JC STR ; the above step will set the borrow(carry) if the decimal was < 10 as it became -ve. if borrow is set, jump to the store step (STR).
		MOV A, #0F ; if no borrow was set, it means resulting decimal was not a number. 0F signifies failure
		SJMP SET; unconditional jump to set result step (SET).
STR:	ADD A,#0A; //restore the value of A to it's decimal equivalent before testing.
SET:	MOVX @DPTR,A; //set the result to DPTR
EXIT:	SJMP EXIT

; execute this and then check address location 4500 for the result. 0F means failure.