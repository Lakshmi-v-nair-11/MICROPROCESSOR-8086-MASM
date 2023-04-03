data segment
	str1 db 20 dup("$")
	str2 db 20 dup("$")
	msg1 db 10,13,"Enter the first string :$"
	msg2 db 10,13,"Enter the second string :$"
	msg3 db 10,13,"Tne concatinated string is : $"
data ends

code segment 
	assume cs:code,ds:data
	start:

		mov dx,data
		mov ds,dx


		lea dx,msg1
		mov ah,09h
		int 21h

		lea si,str1		
		repeat:mov ah,01h
		int 21h
		cmp al,13
		je skip
		mov [si],al
		inc si
		jmp repeat


		skip:lea dx,msg2
		mov ah,09h
		int 21h

		lea si,str2
		repeat2:mov ah,01h
		int 21h
		cmp al,13
		je skip1
		mov [si],al
		inc si
		jmp repeat2

		
		skip1:lea si,str1
		lea di,str2
		mov al,'$'
		
		up:cmp [si],al
		jz next
		inc si
		jmp up

		next:cmp [di],al
		jz exit
		mov bl,[di]
		mov [si],bl

		inc si
		inc di
		jmp next

		exit:lea dx,msg3
		mov ah,09h
		int 21h


		mov [di],al
		lea dx,str1
		mov ah,09h
		int 21h




		mov ah,4ch
		int 21h

	code ends
end start

