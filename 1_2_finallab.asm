.model small
.stack 100h
.data

str1 db 10,13,"Enter an odd number :$"
str2 db "Enter a Three character string:$"
str3 db 30 dup ("$")
str5 db "Number is not odd.$"
variable1 dw ?
variable2 dw ?
variable3 dw ?
variable4 dw ?
variable5 dw ?
str4 db "Value of Ax is:$"


.code
main proc

		mov Ax, @Data
		mov Ds, Ax
		mov Es,Ax

cc2:		mov Dx, offset str1
		mov Ah, 09h
		INT 21h

		CALL decimalinput
		mov variable1,Bx

		mov Ax, Bx

		mov Bx, 2
		mov Dx, 0

		Div Bx

		cmp Dx, 0
		JE cc1

		mov Dx, offset str2
		mov Ah, 09h
		INT 21h

		mov Si, offset str3

		mov Ch, 3

aa1:		mov Ah, 01h
		INT 21h

		mov [Si],Al
		INC Si
		DEC Ch
		JNZ aa1

		CALL Nextline

		mov Cx, variable1

		CALL displayline

		CALL nextline

		mov Ax, variable1
		SUB Ax,5		

		mov Bx,2
		mov Dx,0

		Div Bx

		mov variable2, Ax

again:		CALL simpleline
		CALL nextline

		DEC variable2
		JNZ again

		mov Ax, variable1
		SUB Ax, 5		;error
		
		mov Bx, 2
		mov Dx, 0

		DIV Bx

		mov variable4, Ax
		
		mov variable3 ,3		;error

again4:		CALL characterline
		CALL nextline

		DEC variable3
		JNZ again4

		mov Ax, variable1
		SUB Ax,5		

		mov Bx,2
		mov Dx,0

		Div Bx

		mov variable5, Ax

again6:		CALL simpleline
		CALL nextline

		DEC variable5
		JNZ again6

		mov Cx, variable1
		CALL displayline
		jmp exit 

cc1:		mov Dx, offset str5
		mov Ah, 09h
		INT 21h
		jmp cc2

exit:		mov Ah, 4ch
		INT 21h

main endp

		decimalinput proc

		mov Bx,0

again1:		mov ah,01h
		int 21h

		cmp al,13
		JE aa2

		sub al,48
		AND Ax,000Fh

		PUSH Ax
		mov Ax,10
		MUL Bx
		POP Bx

		add Bx,Ax
		jmp again1

aa2:		ret

		decimalinput endp

		displayline proc

aa3:		mov Dl, '*'
		mov Ah,02h
		INT 21h

		DEC Cx
		JNZ aa3
		ret
		
		displayline endp

		nextline proc

		mov Dl, 10
		mov Ah,02h
		INT 21h

		mov Dl, 13
		mov Ah, 02h
		INT 21h

		ret

		nextline endp

		simpleline proc

		mov Dl, '*'
		mov Ah, 02h 
		INT 21h
		
		mov Cx, variable1
		SUB Cx,2		;error

aa4:		mov Dl, ' '
		mov Ah,02h 
		INT 21h

		DEC Cx
		JNZ aa4

		mov Dl, '*'
		mov Ah, 02h 
		INT 21h
		
		ret
		simpleline endp

		characterline proc

		mov Dl, '*'
		mov Ah, 02h
		INT 21h

		mov Cx, variable4
		
again1:		mov Dl, ' '
		mov Ah, 02h
		INT 21h

		DEC Cx
		JNZ again1

		mov Di , offset str3

		mov Ch, 3

aa9:		mov Dl, [Di]
		mov Ah, 02h
		INT 21h

		INC Di
		DEC Ch
		JNZ aa9

		mov Cx, variable4

again2:		mov Dl, ' '
		mov Ah, 02h
		INT 21h

		DEC Cx
		JNZ again2

		mov Dl, '*'
		mov Ah, 02h
		INT 21h

		ret 
		characterline endp
		
end main       