.model small
.stack 100h
.386
.data
str1 db "Enter Binary Number as Input upto 8 digits: $"
str2 db 10,13,"$"
str3 db "The Binary Sum is: $"
str4 db "Illegal Character, Try Again: $"

.code
main proc
		mov Ax,@data
		mov DS,Ax
		
		mov Dx,offset str1
		mov ah,09h
		int 21h
		
		mov Ch,8
		XOR Bl,Bl
again1:		mov ah,01h
		int 21h
		cmp al,13
		JE again2
		cmp al,'1'
		JG try
		sub al,30h
		SHL bl,1
		OR bl,al

		dec Ch
		jnz again1

		mov Dx,offset str2
		mov ah,09h
		int 21h

		mov Dx,offset str1
		mov ah,09h
		int 21h
		
		mov Cl,8
		XOR Bh,Bh
again2:		mov ah,01h
		int 21h
		cmp al,13
		JE output
		cmp al,'1'
		JG try
		sub al,30h
		SHL bh,1
		OR bh,al

		dec Cl
		jnz again2

		jmp output

try:		mov Dx,offset str2
		mov ah,09h
		int 21h
		mov Dx,offset str4
		mov ah,09h
		int 21h
		jmp again1

		jmp output
 

output:		mov Dx,offset str2
		mov ah,09h
		int 21h
		
		mov Dx,offset str3
		mov ah,09h
		int 21h
		
		add bh,bl

		mov Cl,8
again3:		SHL Bh,1
		JC print1
		mov dl,'0'
		mov ah,02h
		int 21h
		jmp aa2

print1:		mov dl,'1'
		mov ah,02h
		int 21h

aa2:		dec Cl
		jnz again3

mov ah,4ch
int 21h

main endp
end main