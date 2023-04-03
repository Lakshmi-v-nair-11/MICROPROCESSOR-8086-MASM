assume cs:code,ds:data

data segment
	msg1 db 10,13,"number 1 : $"
	msg2 db 10,13,"number 2 : $"
	msg3 db 10,13,"Product is : $"
data ends

code segment
	start:
		mov ax,data
		mov ds,ax

		lea dx,msg1
		mov ah,09h
		int 21h

		mov ah,01h
		int 21h
		sub al,"0"
		mov bh,al

		lea dx,msg2
		mov ah,09h
		int 21h

		mov ah,01h
		int 21h
		sub al,"0"
		mov bl,al

		mul bh
		mov ah,0
		aam
		
		add al,"0"
		add ah,"0"
		mov bx,ax

		lea dx,msg3
		mov ah,09h
		int 21h

		mov ah,02h
		mov dl,bh
		int 21h

		mov ah,02h
		mov dl,bl
		int 21h

		mov ah,4ch
		int 21h

code ends
end start


		
