.model small
.stack 100h
.data
str1 db "Enter only digits: $" 
str4 db "Enter operator: $"
str2 db 10,13,"$"
str3 db "sum is: $"
str5 db "Subtraction is: $"
str6 db "Error!Subtraction is less than 0$"
.code
main proc
		mov Ax,@data
		mov DS,Ax
		
		mov dx,offset str1
		mov ah,09h
		int 21h

		mov ah,01h
		int 21h
		sub al,30h
		mov bl,al

		mov ah,01h
		int 21h
		sub al,30h
		mov bh,al

		mov dx,offset str2
		mov ah,09h
		int 21h

		mov dx,offset str4
		mov ah,09h
		int 21h

		mov ah,01h
		int 21h
		cmp al, 2Bh
		JE aa

		mov dx,offset str2
		mov ah,09h
		int 21h

		sub bl,bh
		cmp bl,0
		JL bb
		mov dx,offset str5
		mov ah,09h
		int 21h
		
		mov dl,bl
		add dl,30h
		mov ah,02h
		int 21h 
		jmp exit


aa:		mov dx,offset str2
		mov ah,09h
		int 21h
		add bl,bh
		mov dx,offset str3
		mov ah,09h
		int 21h
		
		mov dl,bl
		add dl,30h
		mov ah,02h
		int 21h
		jmp exit
bb:		mov dx,offset str6
		mov ah,09h
		int 21h
		jmp exit
	
exit:	mov ah,4Ch
	int 21h

main endp
end main