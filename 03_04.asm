.model small 
.stack 100h
.data
str1 db 10,13,'$'
.code 
main proc 
	mov ax,@data
	mov ds,ax

	mov ch,10
aa:	MOV CL,10

bb:	mov dl,'*'
	mov ah,02h
	INT 21h

	 dec cl
	JNZ bb
 	mov dx,offset str1
	mov ah,09h
	int 21h

	dec ch
	JNZ aa

mov ah,4ch
int 21h
main endp
end main    

