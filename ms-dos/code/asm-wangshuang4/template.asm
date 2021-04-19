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


        mov ax,4c00h
        int 21h

code ends
end start
