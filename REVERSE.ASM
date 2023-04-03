data segment
    msg1 db 10,13,"enter string: $"
    msg2 db 10,13,"new string: $"
    str1 db 30 dup("$")
    str2 db 30 dup("$")
    count db 0
data ends

code segment
    assume cs:code,ds:data
    start:
            mov ax,data
            mov ds,ax

            lea dx,msg1
            mov ah,09h
            int 21h

            lea si,str1
            mov ah,01h
    repeat: int 21h
            cmp al,13
            je skip
            mov [si],al
            inc si
            inc count
            jmp repeat

      skip: lea di,str2
            dec si
     loop1: mov bl,[si]
            mov [di],bl
            inc di
            dec si
            dec count
            JNZ loop1

            lea dx,msg2
            mov ah,09h
            int 21h

            lea dx,str2
            mov ah,09h
            int 21h
code ends
end start