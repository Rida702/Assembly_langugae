.model small
.stack 100h
.386
.data
str1 db "Enter a Character: $"
str2 db 10,13,"$"
.code
main proc
		mov Ax,@data
		mov DS,Ax

		mov Dx,offset str1
		mov ah,09h
		int 21h 

		mov ah,01h
		int 21h

dobara:		mov Dx,offset str2
		mov ah,09h
		int 21h

		XOR bl,bl
		mov Cx,2
		mov bl,al
again:		ROL bl,4
		mov dl,bl
		AND dl,0Fh
		cmp dl,9
		JG letter
		add dl,30h
		jmp aa

letter:		add dl,37h
aa:		mov ah,02h
		int 21h
		dec Cx
		jnz again
		
		mov Dx,offset str2
		mov ah,09h
		int 21h
		
		mov Dx,offset str1
		mov ah,09h
		int 21h

		mov ah,01h
		int 21h
		cmp al,13
		JNE dobara

		jmp exit

exit:	mov ah,4Ch
	int 21h

main endp
end main


