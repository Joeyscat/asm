assume cs:code,ds:data,ss:stack

data segment
    db	'1975','1976','1977','1978','1979','1980','1981','1982','1983'
    db	'1984','1985','1986','1987','1988','1989','1990','1991','1992'
    db	'1993','1994','1995'
    ; 以上标识21年的21个字符串 year


    dd	16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
    dd	345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000
    ; 以上是标识21年公司总收入的21个dword数据 summ

    dw	3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
    dw	11542,14430,15257,17800
data ends

table segment
                ;0123456789ABCDEF
    db  21 dup ('year summ ne ?? ')
table ends

stack segment
    db  128 dup (0)
stack ends

code segment
    start:
        mov ax,stack
        mov ss,ax
        mov sp,128

        call input_table


        mov ax,4c00h
        int 21h

; ---------------------------------------------------
    input_table:
        mov bx,data
        mov ds,bx
        mov si,0

        mov bx,table
        mov es,bx
        mov di,0

        mov bx,21*4*2
        mov cx,21

    inputTable:
        push ds:[si+0]
        pop es:[di+0]
        push ds:[si+2]
        push es:[di+2]

        mov ax,ds:[si+21*4+0]
        mov dx,ds:[si+21*4+2]

        mov es:[di+5],ax
        mov es:[di+7],dx

        push ds:[bx]
        pop es:[di+10]

        div word ptr es:[di+10]

        mov es:[di+13],ax

        add di,16
        add si,4
        add bx,2

        loop inputTable

        ret

code ends
end start
