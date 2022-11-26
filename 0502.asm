.model small
.stack 100h
.386
.data
str1 db "Enter Binary Number as Input upto 16 digits: $"
str2 db 10,13,"$"
str3 db "Your Output in Hexa is: $"
str4 db "Illegal Character, Try Again: $"

.code
main proc
		mov Ax,@data
		mov DS,Ax
		
		mov Dx,offset str1
		mov ah,09h
		int 21h
		
		mov Ch,16
		XOR Bx,Bx
again1:		mov ah,01h
		int 21h
		cmp al,13
		JE output
		cmp al,'1'
		JG try
		sub al,30h
rotate:		SHL bx,1
		OR bl,al

aa1:		dec Ch
		jnz again1
		
		jmp output

try:		mov Dx,offset str2
		mov ah,09h
		int 21h
		mov Dx,offset str4
		mov ah,09h
		int 21h
		jmp again1

output:		mov Dx,offset str2
		mov ah,09h
		int 21h
		
		mov Dx,offset str3
		mov ah,09h
		int 21h
		
		mov Ch,4
again2:		ROL bx,4
		mov dl,bl
		AND dl,0Fh
		cmp dl,9
		JG letter2
		add dl,30h
		jmp aa2
		
letter2:	add dl,37h
		jmp aa2

aa2:		mov ah,02h
		int 21h
		dec Ch
		jnz again2

mov ah,4ch
int 21h

main endp
end main