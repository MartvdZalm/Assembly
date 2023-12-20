.section .data
value:
	.quad 10

.section .text
.globl _start
_start:
	movq $10, %rax
	movq $5, %rbx
	cmpxchg %rbx, value
	movq $1, %rax
	int $0x80
