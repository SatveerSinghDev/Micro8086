.model small
.data
a db "Enter an ASCII character: $"
b db 13,10, "Inputted number's ASCII represented in Binary= $"

.code
start:	
	mov ax,@data
	mov ds,ax
	
	mov dx,offset a
	mov ah,09
	int 21H
	
	mov ah,01
	int 21H

	mov bl,al
	mov cl,08

	mov dl,offset b
	mov ah,09H
	int 21H
	
L1:	shl bx,1	
	mov dl,bh
	add dl,30H
	mov bh,00

	mov ah,02
	int 21H
	loop L1

.exit
end start
