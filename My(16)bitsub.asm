.model small
.data
a dw 1110h
b dw 123fh
.code
start:
mov ax,@data
mov ds,ax
mov ax,a

mov bx,b
sub ax,bx
mov ch,04h
mov cl,04h
mov bx,ax
L2:
rol bx,cl
mov dl,bl
and dl,0fh
cmp dl,09
jbe L4
add dl,07h
L4:
add dl,30h
mov ah,02
int 21h
dec ch
jnz L2
mov ax,4c00h
int 21h
end start
