.model small
.stack 100h
.data
str1 db "Enter Input: $"
str2 db 10,13,"Your Output: $"

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

		mov dl,bl
		mov ah,02h
		int 21h

mov ah,4Ch
int 21h


main endp
end main