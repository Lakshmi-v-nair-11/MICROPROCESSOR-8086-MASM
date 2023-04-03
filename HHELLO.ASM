assume ds:data,cs:code

data segment
msg db 10,13,"hello world"
data ends

code segment
start:
        mov ax,data
        mov ds,ax

        mov ah,09h
        lea dx,msg
        int 21h

        mov ah,4ch
        int 21h

code end
end start
