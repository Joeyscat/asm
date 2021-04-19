assume cs:code

data segment
    db 'Welcome to masm!',0
data ends

code segment
    start:
        mov dh,8
        mov dl,3
        mov cl,2
        mov ax,data
        mov ds,ax
        mov si,0
        call show_str

        mov ax,4c00h
        int 21h


    ;名称：show_str
    ;功能：在指定的位置，用指定的颜色，显示一个用0结束的字符串。
    ;参数：(dh)=行号(取值范围0~24)，(dl)=列号(取值范围0~79)
    ;       (cl)=颜色，ds:si指向字符串的首地址
    ;返回：无
    show_str:
        mov bx,0B800H
        mov es,bx
        showRow:
    mov dl,ds:[si]
    mov es:[di],dx
    add di,2
    inc si
    loop showRow

code ends
end start
