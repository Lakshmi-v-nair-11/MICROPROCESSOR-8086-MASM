data segment
    str1 db 30 dup("$")
    str2 db 30 dup("$")
    msg1 db 10,13,"enter string:$"
    msg2 db 10,13,"new string:$"
    msg3 db 10,13,"palindrome$"
    msg4 db 10,13,"not palindrome$"
    count db 0
    tcount db 0
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
     repeat:int 21h
            cmp al,13
            je skip
            mov [si],al
            inc si
            inc count
            jmp repeat
        skip:
            mov bh,count

            lea dx,str1
            mov ah,09h
            int 21h

            lea si,str1
            lea di,str2
     loop1: mov bl,[si]
            mov cl,[di]
            cmp bl,cl
            jne next
            inc si
            inc di
            dec bh
            jz next2
            jmp loop1

     next: lea dx,msg4
           mov ah,09h
           int 21h
           jmp skip2
     next2:lea dx,msg3
           mov ah,09h
           int 21h
           jmp skip2

     skip2:mov ah,4ch
           int 21h

code ends
end start
