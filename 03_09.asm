.model small
.stack 100h
.data
str1 db "Enter only digit from 0 to 9: $" 
str2 db 10,13,"$"
.code
main proc
		mov Ax,@data
		mov DS,Ax
		
		mov dx,offset str1
		mov ah,09h
		int 21h

		mov ah,01h
		int 21h
		mov bl,al

		mov dx,offset str2
		mov ah,09h
		int 21h
		
		mov al,30h
bb:		mov dl,al
		mov ah,02h
		int 21h

		cmp dl,bl
		JE exit

		mov dx,offset str2
		mov ah,09h
		int 21h
		INC al
		jmp bb
exit:	mov ah,4Ch
	int 21h

main endp
end main