.model small
.stack 100h
.data
str1 db "Enter only digit from 0 to 9: $" 
str2 db 10,13,"$"
str3 db 10,13,"Invalid Input$"
str4 db 10,13,"Do you want to continue(y) or exit(n)$"
.code
main proc
		mov Ax,@data
		mov DS,Ax
		
again:		mov dx,offset str2
		mov ah,09h
		int 21h
		
		mov dx,offset str1
		mov ah,09h
		int 21h

		mov ah,01h
		int 21h
		mov bl,al

		mov dx,offset str2
		mov ah,09h
		int 21h
		
		mov bh,3Ah
		cmp bl,bh
		JA aa
		mov al,30h
bb:		mov dl,al
		mov ah,02h
		int 21h

		cmp dl,bl
		JE cc

		mov dx,offset str2
		mov ah,09h
		int 21h
		INC al
		jmp bb
		
cc:		mov dx,offset str4
		mov ah,09h
		int 21h

		mov ah,01h
		int 21h
		mov cl,al
		cmp cl,79h
		JE again
		jmp exit

aa:		mov dx,offset str3
		mov ah,09h
		int 21h
		jmp cc

exit:	mov ah,4Ch
	int 21h

main endp
end main