assume cs:code,ds:data,ss:stack

data segment
    dw 1234
data ends

stack segment
    db  128 dup (0)
stack ends

code segment
    start:
        mov ax,stack
        mov ss,ax
        mov sp,128

        mov bx,data
        mov ds,bx
        mov si,0

        mov bx,0B800H
        mov es,bx
        mov di,160*10
        add di,40*2

        mov ax,ds:[si]
        mov dx,0

        call short_div


        mov ax,4c00h
        int 21h
    
    short_div:
        mov cx,10
        div cx
        add dl,30H
        mov es:[di+0],dl
        mov byte ptr es:[di+1],00000010B

        mov cx,ax
        jcxz short_div_ret

        mov dx,0
        sub di,2
        jmp short_div

    short_div_ret:
        ret
    

code ends

end start
