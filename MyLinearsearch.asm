.model small
.386p
.stack
.data

ARRAY db 10 dup(?)
msg0 db 13,10,"ENTER NO.:$"
msg1 db 13,10,"ENTER NUMBER OF ELEMENTS:$"
msg2 db 13,10,"ENTER NUMBER TO BE SEARCHED:$"
msg4 db 13,10,"NUMBER FOUND AT POSITION:$"

msg3 db 13,10,"NUMBER NOT FOUND$"

key db ?
n db ?

.code
start:
	mov eax,@data
	mov ds,eax
	
	mov dx,offset msg1
	mov ah, 09H
	int 21H
	mov ah,01H
	int 21H
	mov n,al
	sub n,30H
	mov cl,n

	
	
INPUT:
	mov dx,offset msg0
	mov ah,09H
	int 21H
	
	mov ah,01H
	int 21H
	
	mov ARRAY[si],al
	inc si
	LOOP INPUT
	
	mov dx,offset msg2
	mov ah,09H
	int 21H
	
	mov ah,01H
	int 21H
	
	mov key,al
	mov cl,n
	mov si,0

SEARCH:
	mov bl,ARRAY[si]
	cmp key,bl
	
	je FO
	
	inc si
	LOOP SEARCH
	
	mov dx,offset msg3
	mov ah,09H
	int 21H
	jmp EXIT
	
FO:	
	mov dx,offset msg4
	mov ah,09H
	int 21H
	
	
	mov dx,si
	add dx,31H	
	mov ah,02H
	int 21H
	
EXIT:
	.exit
	end start
