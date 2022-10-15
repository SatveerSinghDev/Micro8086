.model small
.386p
.data
a dd 0FFFFFFFh
b dd 01111111h
.code
start:
	mov eax,@data
	mov ds,ax
	mov eax,a
	mov ebx,b
	add eax,ebx	
	mov ch,08h
	mov cl,04h
	mov ebx,eax
L2:
	rol ebx,cl
	mov dx,bx
	and dx,000fh
	cmp dl,09
	jbe L4
	add dx,0007h
L4:
	add edx,0030h
	mov ah,	02
	int 21h
	dec ch
	jnz L2
	mov ax,4c00h
	int 21h
	end start
