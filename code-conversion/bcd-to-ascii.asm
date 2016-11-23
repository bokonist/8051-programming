;BCD to ASCII conversion
;i/p : [9000]=99

		MOV A, #09; move 9 to A.
		MOV R0,A; move it to r0. r0 now contains 9hex
		MOV DPTR, #9000; get the input.
		MOVX A,@DPTR; move it to A
		MOV R5,A; move it to r5. input is saved here for later use. R5 now contains 99hex (1001 1001)bin.
		ANL A, #F0; LOGICAL AND A and F0. result in A. A is now (1001 0000)bin
		SWAP A; swap bits 0-3 and 4-7 of accumilator. A is now (0000 1001) bin
		MOV R1,A; move it to r1.
		MOV A,R5; get input again from r5.
		ANL A, #0F; LOGICAL AND A and 0F. result in A. A is now (0000 1001)bin
		MOV R2,A; move it to r2.
		;at this point, r1 and r2 contains our two BCD numbers, separated.
		MOV A,R1; get the first BCD number.
		MOV B, #0A; multiplier
		MUL AB; multiply it with 10dec.
		ADD A,R2; add it to r2. result in A.
		INC DPTR; inc DPTR to store result.
		MOVX @DPTR,A; store result in DPTR.
; at this point A contains the decimal equivalent.
		CLR C; clear carry
		SUBB A,#30; subtract ascii of '0'
		CLR C; clear carry
		SUBB A,#0A; valid decimal check
		JC RSTR; if yes, jump to restore step
SET:	MOV A,#0F; set failure. 0f indicates invalid BCD.
		SJMP STR; store the result
RSTR:	ADD A, #0A; restore the dec value of A.
STR:	MOVX @DPTR,A;
exit:	SJMP exit;