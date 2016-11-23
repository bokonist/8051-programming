; Linear Search

		MOV A,#00; set A to 0.
		MOV DPTR,#4600; output location
		MOVX @DPTR,A; clear output to 0.
		MOV R0,#05; set number of elements in r0.
		MOV DPTR, #4500; first(or next) input location.
		MOV R1, #06; move 6 (key to be searched) to r1.
LOOP:	MOVX A,@DPTR; get input from DPTR
		SUBB A,R1; subb from a. 
		JZ FOUND; if both are equal, 0 bit will be set. this is the found condition.
		INC DPTR; not found. inc DPTR to next i/p location.
		DJNZ R0,LOOP; decrement teh number of elements variable. if there are any left, try next input.
		MOV A,#00; not found. we ran out of i/p. so set A as 00. 
		SJMP STR; jump to store result step.
FOUND:	MOV A,#FF; success. FF indicates found.
STR:	MOV DPTR, #4600; o/p location
		MOVX @DPTR,A; store result
EXIT:	SJMP EXIT; halt.

; i/p is
; [4500]:09 [4501]:01 [4502]:06 [4503]:07 [4504]:04
; out of the 5 elements, the key we searched (06) will be found at [4502]
; so o/p: [4600] will be set as FF