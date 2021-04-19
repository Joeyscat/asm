assume cs:codesg,ds:datasg

datasg segment
    db 'welcome to masm!'
    db '................'
datasg ends

codesg segment

    start:
    mov ax,data


    mov ax,4c00h
    int 21h

codesg ends

end