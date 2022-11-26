.model small
.stack 100h
.data


.code
main proc
		mov Ax,@data
		mov DS,Ax
		
		mov dl,'N'
		mov ah,02h
		int 21h

mov ah,4Ch
int 21h


main endp
end main