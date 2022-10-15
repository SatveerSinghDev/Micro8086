.model small
.data
a db "Enter 8-bit binary number: $"
b db 13,10, "Inputted number's ASCII represented in Hex= $"

.code
start:	
	mov ax,@data
	mov ds,ax
	
	mov dx,offset a
	mov ah,09
	int 21H
	mov cl,08

L1:	mov ah,01
	int 21H
	sub al,30H
	shl bl,1	
	add bl,al
	loop L1
	
	mov dl,offset b
	mov ah,09H
	int 21H
	
	mov dl,bl
	mov ah,02
	int 21H

.exit
end start
