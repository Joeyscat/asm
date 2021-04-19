assume cs:code

data segment
    db 'word',0
    db 'unix',0
    db 'wind',0
    db 'good',0
data ends

code segment
    start:
        mov ax,data
        mov ds,ax
        mov bx,0

        mov cx,4
        s:
        mov si,bx
        call capital
        add bx,5
        loop s

        mov ax,4c00h
        int 21h

    ; 说明：讲一个全是字母，以0结尾的字符串，转化为大写
    ; 参数：ds:si指向字符串的首地址
    ; 结果：没有返回值
    capital:
            push cx
            push si

    change:
            mov cl,[si]
            mov ch,0
            jcxz ok                     ; 如果(cx)=0，结束；如果不是0，处理
            and byte ptr [si],11011111b ; 将ds:si所指单元中的字母转化为大写
            inc si                      ; ds:si指向下一个单元
            jmp short capital
        ok:
            pop si
            pop cx
            ret

code ends
end start
