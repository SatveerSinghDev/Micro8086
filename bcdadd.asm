.model small
.386p

.data
a dd 09999999H
b dd 00000001H
c db 13,10,"Sum = $"
 
.code
start:	
	mov eax,@data
	mov ds,eax
	
	mov eax,a
	mov ebx,b
	
	add al,bl	
	DAA
	mov cl,al
	
	mov al,ah
	adc al,bh
	DAA
	mov ch,al
	
	push cx
	mov ecx,0
	pushf

	shr eax,16
	shr ebx,16
	clc
	
	popf
	adc al,bl	
	DAA
	mov cl,al
	
	mov al,ah
	adc al,bh
	DAA
	mov ch,al
	
	shl ecx,16
	pop cx

	mov ebx,00
	mov ebx,ecx
	
	mov dx,offset c
	mov ah,09
	int 21H
	
	mov ecx,8

L2:	rol ebx,4
	mov dl,bl
	and dl,0fH
	add dl,30H	
	mov ah,02
	int 21H
	loop L2

.exit
end start
