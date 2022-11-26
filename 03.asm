.model small
.stack 100h
.data
str1 db "Enter Character: $"
str2 db 10,13,"$"
str3 db "The number of 1 bit is: $"

.code
main proc
		mov Ax,@data
		mov DS,Ax

		mov Dx,offset str1
		mov ah,09h
		int 21h
		
		mov ah,01h
		int 21h		
		mov bl,al

		mov Dx,offset str2
		mov ah,09h
		int 21h
		
		mov Cx,8
		mov bh,0
again:		ROL bl,1
		JC print
		mov dl,'0'
		mov ah,02h
		int 21h
		jmp aa

print:		mov dl,'1'
		mov ah,02h
		int 21h
		inc bh
		
aa:		dec Cx
		JNZ again
		
		mov Dx,offset str2
		mov ah,09h
		int 21h

		mov Dx,offset str3
		mov ah,09h
		int 21h
		
		mov dl,bh
		add dl,30h
		mov ah,02h
		int 21h

exit:	mov ah,4ch
	int 21h

main endp
end main