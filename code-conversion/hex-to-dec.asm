; Hexadecimal to Decimal conversion
; i/p is [4500]= 0xFF (convert it to equivalent decimal)
	
		MOV DPTR, #4500; DPTR points to input
		MOVX A,@DPTR; get the input to A
		MOV B, #64; first, we set the divisor as 100dec, 64h.
		DIV AB; divide the hex input with 100dec.quotient in A, remainder in B. 
		MOV DPTR, #4501; DPTR points to result storage location
		MOVX @DPTR, A; move quotient to result location.
		MOV A,B; move remainder to A.
		MOV B, #0A; set the next divisor as 10dec. 0A hex.
		DIV AB; divide the hex input with 10dec. quotient in A, remainder in B. 
		INC DPTR; point to next result location
		MOVX @DPTR,A; store the quotient 
		INC DPTR; point to	next result location
		MOV A,B; move whatevers remaining to A
		MOVX @DPTR,A; store whatevers remaining
EXIT:	SJMP EXIT; halt 

;execute and the result will be in [4501] ,[4502] and [4503]. in this case, their contents would be 2,5,5 respectively.