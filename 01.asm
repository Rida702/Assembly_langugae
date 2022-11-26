.model small
.stack 100h
.data
str1 db "Enter String: $"
str3 db 10,13,"$"
str2 db 500 dup("$")
str4 db "In Reverse Order: $"

.code
main proc
		mov Ax,@data
		mov DS,Ax
		
		mov Dx,offset str1
		MOV AH,09h
		int 21h
		
		mov Cx,0
		mov si,offset str2
aa:		mov ah,01h
		int 21h
		MOV [si],al
		inc Cx
		inc si
		cmp al,13
		JNE aa

		mov Dx,offset str3
		MOV AH,09h
		int 21h

bb:		mov dl,[si]
		mov ah,02h
		int 21h
		dec si
		dec Cx
		cmp Cx,0
		JNE bb
		
		mov dl,[si]
		mov ah,02h
		int 21h
		
		
exit:	mov ah,4ch
	int 21h

main endp
end main