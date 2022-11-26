.model small
.stack 100h
.data

str1 db "Enter a String: $"
str2 db "Copied string is :$"
str3 db 500 dup ("$")

.code

main proc

		mov Ax, @data
		mov Ds, Ax
		mov Es, Ax

		Lea Dx, str1
		mov Ah, 09h
		INT 21h

		
		lea Di, str3
		CLD

again:		mov Ah, 01h
		INT 21h
				
		STOSB

		cmp Al, 13
		JE next

		jmp again

next:		lea Dx, str2
		mov Ah, 09h
		INT 21h

		lea Dx, str3
		mov Ah, 09h
		INT 21h

		mov Ah, 4ch
		INT 21h

main endp
end main