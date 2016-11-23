; check if a sequence of numbers is a palindrome or not. works with strings too.
; i/p. store the sequence of numbers in a contigious memory location.
; [4500]:01 [4501]:02 [4502]:03 [4503]:04 [4504]:04 [4505]:03 [4506]:02 [4507]:01
; store the length of the seqence in a locaion. [450A]:08
			MOV DPTR, #450A; get the length
			MOVX A, @DPTR; move it to A.
			MOV B,#02; divisor
			DIV AB; divide length by 2. result in A.
			MOV R0,A; save result in r0.
			MOV R1,A; save result in r1.

			MOV DPTR,#4500; point to beginning of sequence
PSH:		MOVX A, @DPTR; move to Accumilator
			PUSH A; push it to stack
			INC DPTR; point to next number in the sequence
			DJNZ R0,PSH; decrement r0. check if 0. if not, jump to PSH.

;at this point, half the sequnce is pushed onto the stack. now we check the other half if it's a palindrome.

PP:			POP DPL; pop from stack
			MOVX B,@DPTR; move data to B. 
			MOV A,#00; clear A to 0.
			MOVC A,@A+DPTR; add the contents of A and DPTR and move to A.
			CJNE A, B, FAIL; //compare A and B. if they're not equal, it's not a palindrome.
			INC DPTR; next sequence element.
			DJNZ R1,PP; repeat length/2 times.
			SJMP SUCCESS; all elements are evaluated. no conflicts found. so it is a palindrome.

FAIL:		MOV DPTR, #4600; result location
			MOV A,#00; 00 indicates failure
			MOVX @DPTR,A; move to location
			SJMP HLT; halt

SUCCESS:	MOV DPTR, #4600; result location
			MOV A,#FF; FF indicates success
			MOVX @DPTR,A; move to location
HLT:		SJMP HLT; halt