# functiontest1.s - An example of a simple function
.section .text
.globl _start

.type calculate, @function
calculate:
	push %rbp
	movq %rsp, %rbp
	
	movq 16(%rbp), %rax
	addq 24(%rbp), %rax 
	
	movq %rbp, %rsp
	pop %rbp
	ret


_start:
	push $4
	push $5
	call calculate
	
	movq $1, %rax
	movq $0, %rbx
	int $0x80
