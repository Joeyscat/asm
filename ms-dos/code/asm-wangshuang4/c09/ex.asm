assume cs:codesg,ds:datasg,ss:stacksg

datasg segment
    db 'welcome to masm!'       ; ds:[si]
    db 00000010B                ; 00000000  ds:[bx]
                                ;  rgb rgb
    db 00100100B
    db 01110001B
datasg ends

stacksg segment
    db 128 dup(0)
stacksg ends

codesg segment
   start:
    mov ax,stacksg
    mov ss,ax
    mov sp,128

    mov bx,datasg
    mov ds,bx

    mov bx,0B800H
    mov es,bx

    mov si,0
    mov di,160*10 + 30*2
    mov bx,16
    mov dx,0

    mov cx,3
    
  showRows:

    push bx
    push cx
    push si
    push di

    mov cx,16
    mov dh,ds:[bx]

  showRow:
    mov dl,ds:[si]
    mov es:[di],dx
    add di,2
    inc si
    loop showRow

    pop di
    pop si
    pop cx
    pop bx

    add di,160
    inc bx
    
    loop showRows

    mov ax,4c00h
    int 21h

codesg ends
end start