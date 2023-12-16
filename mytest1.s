# mytest1.s - Contains some assembly
.section .data
value:
	.int 1

.section .text
.globl _start
_start:
	movl $100, %eax
	movl value, %ecx

	addl %eax, value
	subl $1, %ecx

	movl $1, %eax
	movl $0, %ebx
	int $0x80
