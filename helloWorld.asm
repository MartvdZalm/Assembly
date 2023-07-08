section .bss


section .data
	msg: db "Hello World", 0x0A
    	msgLength: equ $-msg

section .text
global _start

_start:
	mov rax, 1 		; system write    
	mov rdi, 1 		; stdout
	mov rsi, msg    	; message to write
	mov rdx, msgLength	; message length
	syscall         	; call kernel

	mov rax, 60     	; system exit
	xor rdi, 0 		; error code 0 (success)
	syscall        		; call kernel
