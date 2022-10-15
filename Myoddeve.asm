.model small
.386p
.data
a dd 12345678H
b db "Enter a number$",13,10
e db "Even no.$",13,10
o db "Odd no.$",13,10
.code
start:
	mov eax,@data
	mov ds,eax
	
	mov ecx,08H ;loop counter
	
	mov dx,offset b	

	mov ah,09h	;to output string b 
	int 21h
	mov eax,28	;shift counter
	mov edx,0 ;flushing edx to 0
	

INPUT:
	push ecx
	push eax
	
	mov ah,01h	;to read character and input is stored in al
	int 21h
	mov bl,al
	mov eax,0 ;flushing eax to 0
	sub bl,30H
	mov al,bl
	pop ecx
	
	shl eax,cl
	add edx,eax ;storing result in edx
	mov eax,ecx
	sub eax,4
	
	pop ecx
	
	LOOP INPUT
	mov ebx,edx
	mov ecx,08h

check:
	and bl,01H
	cmp bl,00h
	je ev
	call NL
	mov dx,offset o
	mov ah,09h
	int 21h
	jmp EXIT

ev:
	call NL
	mov dx,offset e
	mov ah,09h
	int 21h
	jmp EXIT 
NL:
	mov dx,10
	mov ah,02H
	int 21H
	ret

EXIT:
	.exit
	end start
