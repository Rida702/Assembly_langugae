.model small
.stack 100h
.data

str1 db "Enter an odd number :$"
str2 db "Enter a Three character string:$"
str3 db 30 dup ("$")


.code
main proc

		mov Ax, @Data
		mov Ds, Ax
		mov Es,Ax

		mov Dx, offset str1
		mov Ah, 09h
		INT 21h

		CALL decimalinput
		PUSH Bx
		;value in Bx

		mov Dx, offset str2
		mov Ah, 09h
		INT 21h

		mov Si, offset str3

		mov Ch, 3

aa1:		mov Ah, 01h
		INT 21h

		mov Ah, [Si]
		INC Si
		DEC Ch
		JNZ aa1

		CALL Nextline
 		
		POP Bx
		mov Dx,Bx
		mov Cx,Dx
		PUSH Dx

		CALL displayline

		CALL nextline

		POP Dx
		mov Bx, Dx
		PUSH Dx 		;herenextsimpleline 

		mov Cx,Bx
		mov Ax,Bx
		PUSH Bx
		SUB Ax,3		;error

		mov Bx,2
		Div Bx

		mov Cx, Ax

again:		CALL simpleline
		CALL nextline

		DEC Cx
		JNZ again

		mov Ax, Bx
		SUB Ax, 5		;error
		
		mov Bx, 2
		DIV Bx
		
		mov Cx,3		;error

again4:		CALL characterline
		CALL nextline

		DEC Cx
		JNZ again4

		POP Dx
		mov Ax,Dx

		SUB Ax, 3		;error

		mov Bx,2
		Div Bx

		mov Cx, Ax

again6:		CALL simpleline
		CALL nextline

		DEC Cx
		JNZ again6

		CALL displayline

		CALL nextline

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
		POP Bx

		mov Dl, '*'
		mov Ah, 02h 
		INT 21h
		
		mov Cx,Bx
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

		mov Cx, Ax
		PUSH Ax
		
again1:		mov Dl, ' '
		mov Ah, 02h
		INT 21h

		DEC Cx
		JNZ again1

		mov Dx, offset str3
		mov Ah, 09h
		INT 21h

		POP Ax
		mov Cx, Ax

again2:		mov Dl, ' '
		mov Ah, 02h
		INT 21h

		DEC Cx
		JNZ again2

		ret 
		characterline endp
		
end main         

		