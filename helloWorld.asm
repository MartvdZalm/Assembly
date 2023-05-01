section .data
	msg db "Hello World", 0x0A
    	msgLength equ $-msg

    	dValue dd 0
    	bNum db 42
    	wNum dw 5000
    	dNum dd 73000
    	qNum dq 73000000
    	bAns db 0
    	wAns dw 0
    	dAns dd 0
    	qAns dq 0

section .text
global _start

_start:
	mov dword [dValue], 27
	
	mov al, byte [bNum]
	mov byte [bAns], al

	mov ax, word [wNum]
	mov word [wAns], ax

	mov eax, dword [dNum]
	mov dword [dAns], eax

	mov rax, qword [qNum]
	mov qword [qAns], rax

	mov rax, 1      
	mov rdi, 1      
	mov rsi, msg    
	mov rdx, msgLength
	syscall         

	mov rax, 60     
	xor rdi, rdi    
	syscall        
