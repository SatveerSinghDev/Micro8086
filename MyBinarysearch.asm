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
ub db ?
lb db ?
mid db ?
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

	mov cl,n	;to copy no. of elements in upper bound(ub)

	dec cl		;to point to last element index
	
	mov si,0
	
	mov lb,0
	
	mov ub,cl
	
	mov ax,0	;initialize to 0

SEARCH:
	mov al,lb
	mov bl,ub
	
	
	cmp al,bl	;if lb==ub , element not found
	je NFO

	
	cmp key,bl 
	je FO
	
	mov si,ax
	mov cl,ARRAY[si]
	cmp key,cl
	je FO
	
	mov si,bx
	mov cl,ARRAY[si]

	cmp key,cl
	je FO
	
	
	add al,bl	;to compute value of mid
	mov bl,02H
	div bl
	mov mid,al	
	
	mov cl,mid
	mov si,cx
	mov dl,ARRAY[si]
	cmp key,dl	;to compare array element with key
	
	je FO
	jb upper
	ja lower 
	
	jmp EXIT
	
	
lower:
	mov cl,mid
	mov lb,cl
	mov ax,0
	jmp SEARCH
	
upper:
	mov cl,mid
	mov ub,cl
	mov ax,0
	jmp SEARCH
	
FO:	
	mov dx,offset msg4
	mov ah,09H
	int 21H
	
	
	mov dx,si		
	add dx,31H
	mov ah,02H
	int 21H
	jmp EXIT

NFO:
	mov dx,offset msg3
	mov ah,09H
	int 21H
	jmp EXIT
EXIT:
	.exit
	end start
