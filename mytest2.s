.section .data
values:
	.int 10, 20, 30, 40, 50, 60, 70, 80, 90, 100

result:
	.int 0

.section .text
.globl _start
_start:
	movq $0, %rdi

loop:
	movq values(, %rdi, 4), %rax
	addq %rax, (result)
	inc %rdi
	cmpq $10, %rdi	
	jne loop
	
	movq result, %rax
	idivq %rdi
	movq %rax, result

	movq $1, %rax
	movq $0, %rbx
	int $0x80
