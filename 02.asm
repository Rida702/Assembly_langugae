.model small
.stack 100h
.data
str1 db "Enter String: $"
str3 db 10,13,"$"
str2 db 500 dup("$")
str4 db "Vowels characters are: $"

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

		mov Bl,0
bb:		mov dl,[si]
		dec si
		dec Cx
		cmp dl,41h
		JE equal
		cmp dl,45h
		JE equal
		cmp dl,49h
		JE equal
		cmp dl,55h
		JE equal
		cmp dl,61h
		JE equal
		cmp Cx,0
		JE print
		
		jmp bb
equal:		inc Bl
		jmp bb
	
print:		mov dl,Bl
		add dl,30h
		mov ah,02h
		int 21h
		
		
exit:	mov ah,4ch
	int 21h

main endp
end main