.MODEL SMALL
.386p
.DATA

a dd 12345678H
b dd 00000111H

.CODE

START:
	mov eax,@DATA
	mov ds,eax
	mov eax,a
	mov ebx,b
	mul ebx
	mov ch,08H
	mov cl,04H
	mov ebx,eax

L2:	rol edx,cl
	push dx
	and dl,0FH
	cmp dl,09
	jle L3
	add dl,07H	

L3:	add dl,30H
	mov ah,02
	int 21H
	pop dx	
	dec ch	
	jnz L2
	
	mov ch,08H

L4:	rol ebx,cl
	mov dl,bl
	and dl,0FH
	cmp dl,09
	jle L5
	add dl,07H
	
L5:	add dl,30H
	mov ah,02
	int 21H
	dec ch
	jnz L4

EXIT:
.exit
END START
