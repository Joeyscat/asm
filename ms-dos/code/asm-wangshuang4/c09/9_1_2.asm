assume cs:code

data segment
    dd 12345678H
data ends

code segment
  start:
    mov ax,data
    mov ds,ax
    mov bx,0
    mov [bx],bx
    mov [bx+2],[4]
    jmp dword ptr ds:[0]

    mov ax,4c00h
    int 21h

code ends
end start