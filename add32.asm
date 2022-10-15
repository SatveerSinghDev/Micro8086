.model small
.386p
.data
a dd 123f123fH
b dd 11101110H

.code

start:
		mov eax,@data
		mov ds,eax
		mov eax,a
		mov ebx,b
		add eax,ebx
		mov ebx,eax
		mov cl,04H
		mov ch,08H
L2:
		rol ebx,cl
		mov dl,bl
		and dl,0fH
		cmp dl,09
		jbe L4
		add dl,07
L4:
		add dl,30H
		mov ah,02
		int 21H
		dec ch
		jnz L2
		
.exit
end start
