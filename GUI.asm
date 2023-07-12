section .data

	SYSCALL_WRITE equ 1
	SYSCALL_EXIT equ 60
	STDOUT equ 1
	

section .text
global _start

print_world:
	push rbp
	mov rbp, rsp

	sub rsp, 16
	mov byte [rsp + 0], ' '
	mov byte [rsp + 1], 'W'
	mov byte [rsp + 2], 'o'
	mov byte [rsp + 3], 'r'
	mov byte [rsp + 4], 'l'
	mov byte [rsp + 5], 'd'

	mov rax, SYSCALL_WRITE
	mov rdi, STDOUT
	lea rsi, [rsp]
	mov rdx, 6
	syscall

	add rsp, 16

	pop rbp
	ret

print_hello:
	push rbp
	mov rbp, rsp

	sub rsp, 16
	mov byte [rsp + 0], 'H'
	mov byte [rsp + 1], 'e'
	mov byte [rsp + 2], 'l'
	mov byte [rsp + 3], 'l'
	mov byte [rsp + 4], 'o'

	mov rax, SYSCALL_WRITE
	mov rdi, STDOUT
	lea rsi, [rsp]
	mov rdx, 5
	syscall
	
	call print_world

	add rsp, 16
	
	pop rbp
	ret

_start:
	call print_hello

	mov rax, SYSCALL_EXIT
	mov rdi, 0
	syscall

