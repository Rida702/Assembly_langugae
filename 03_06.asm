.model small
.stack 100h
.data
str1 db '?' 
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

		mov ah,01h
		int 21h
		mov bh,al

		mov dx,offset str2
		mov ah,09h
		int 21h

		cmp bl,bh
		JG bb
		mov dl,bl
		mov ah,02h
		int 21h
		mov dl,bh
		mov ah,02h
		int 21h
		jmp exit

bb:		mov dl,bh
		mov ah,02h
		int 21h
		mov dl,bl
		mov ah,02h
		int 21h	
		jmp exit	

exit:	mov ah,4Ch
	int 21h

main endp
end main