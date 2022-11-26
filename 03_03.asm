.model small
.stack 100h
.data
str1 db "Coal's Third Lab.$"

.code
main proc
		mov Ax,@data
		mov DS,Ax
		
		mov Dx,offset str1
		mov ah,09h
		int 21h

mov ah,4Ch
int 21h


main endp
end main