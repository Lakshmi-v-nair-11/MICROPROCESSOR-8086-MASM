data segment
    msg1 db 10,13,"enter numberof elements:$"
    msg2 db 10,13,"enter elements:$"
    msg3 db 10,13,"elements:$"
    str1 db 30 dup("$")
    n db ?
data ends

code segment
    assume cs:code,ds:data
    start:
            mov ax,data
            mov ds,ax

            lea dx,msg1
            mov ah,09h
            int 21h
            mov ah,01h
            int 21h
            sub al,30h
            mov n,al

            lea dx,msg2
            mov ah,09h
            int 21h
            lea si,str1
            mov ah,01h
    loop1:  int 21h
            cmp al,13
            jz skip
            mov [si],al
            inc si
            dec n
            jnz loop1
        skip:
             lea dx,msg3
             mov ah,09h
             int 21h

             lea dx,str1
             mov ah,09h
             int 21h

             mov ah,4ch
             int 21h
code ends
end start
