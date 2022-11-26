.model small 
.stack 100h
.data

str1 db "Enter a String :$"
str2 db 500 dup ("$")
str3 db "The count of vowel characters is: $"

.code
main proc

		mov Ax, @data
		mov Ds, Ax
		mov Es, Ax

		LEA Dx, str1
		mov Ah, 09h
		INT 21h

		lea Di, str2

		mov Cx, 0

again:		mov Ah, 01h
		INT 21h

		INC Cx

		cmp Al, 13
		JE next1

		mov [Di], Al

		INC Di
		jmp again

		mov Bl, 0

next1:		mov Dx, Cx

		STD
bb1:		mov Al, 'A'
		repne SCASB
		JNE check1
		INC Bl

check1:		cmp Cx, 0
		JNE bb1
		
		CLD
		mov Cx, Dx
aa3:		mov Al, 'E'
		repne SCASB
		JNE check2
		INC Bl

check2:		cmp Cx, 0
		JNE aa3

		STD
		mov Cx, Dx
aa4:		mov Al, 'I'
		repne SCASB
		JNE check3
		INC Bl

check3:		cmp Cx, 0
		JNE aa4

		CLD
		mov Cx, Dx
aa5:		mov Al, 'O'
		repne SCASB
		JNE check4
		INC Bl

check4:		cmp Cx, 0
		JNE aa5


		STD
		mov Cx, Dx
aa6:		mov Al, 'U'
		repne SCASB
		JNE check5
		INC Bl

check5:		cmp Cx, 0
		JNE aa6


aa7:		CLD
		mov Cx, Dx
		mov Al, 'a'
		repne SCASB
		JNE check6
		INC Bl

check6:		cmp Cx, 0
		JNE aa7

		
		STD
		mov Cx, Dx
aa8:		mov Al, 'e'
		repne SCASB
		JNE check7
		INC Bl

check7:		cmp Cx, 0
		JNE aa8


		CLD
		mov Cx, Dx
aa9:		mov Al, 'i'
		repne SCASB
		JNE check8
		INC Bl

check8:		cmp Cx, 0
		JNE aa9


		STD
		mov Cx, Dx
aa10:		mov Al, 'o'
		repne SCASB
		JNE check9
		INC Bl

check9:		cmp Cx, 0
		JNE aa10


		CLD
		mov Cx, Dx
aa11:		mov Al, 'u'
		repne SCASB
		JNE check10
		INC Bl

check10:	cmp Cx, 0
		JNE aa11

		lea Dx, str3
		mov Ah, 09h
		INT 21h

		mov DL, bl		
		ADD Dl, 30h
		mov Ah,02h
		INT 21h

		mov Ah, 4ch
		INT 21h
main endp
end main