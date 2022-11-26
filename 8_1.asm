.model small 
.stack 100h
.data

str1 db "Hello there $"
str2 db 50 dup ("$")
str3 db 10,13,"Copied String is :$"


.code

main proc

		mov Ax, @data
		mov Ds, Ax
		mov Es, Ax

		lea Dx, str1
		mov Ah, 09h
		INT 21h
		
		Lea Dx, str3
		mov Ah, 09h
		INT 21h

		lea Si, str1	
		lea Di, str2

		rep movsb

		Lea Dx, str2
		mov Ah, 09h
		INT 21h

		mov Ah, 4ch
		INT 21h

main endp
end main