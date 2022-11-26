.model small
.stack 100h
.386
.data
str1 db "Enter Hexa Number as Input(0 to FFFF): $"
str2 db 10,13,"$"
str3 db "Your Output in Binary is: $"
str4 db "Illegal Character, Try Again: $"

.code
main proc
		mov Ax,@data
		mov DS,Ax
		
		mov Dx,offset str1
		mov ah,09h
		int 21h
		
		XOR Bx,Bx
		mov Ch,4
again1:		mov ah,01h
		int 21h
		cmp al,13
		JE output
		cmp al,'F'
		JG try
		cmp al,39h
		JG letter1
		sub al,30h
		jmp aa1
		
letter1:	sub al,37h
aa1:		SHL Bx,4
		OR bl,al
		dec Ch
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

		mov Cx,16
again2:		SHL Bx,1
		JC print1
		mov dl,'0'
		mov ah,02h
		int 21h
		jmp aa2

print1:		mov dl,'1'
		mov ah,02h
		int 21h

aa2:		dec Cx
		jnz again2

mov ah,4ch
int 21h

main endp
end main