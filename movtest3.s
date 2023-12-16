# movtest3.s - Another example of using indexed memory locations
.section .data
output:
	.int 0
values:
	.int 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60

.section .text
.globl _main
_main:
	movq $0, %rdi
loop:
	movq values(, %rdi, 4), %rax
	movq %rax, output
	inc %rdi
	cmpq $11, %rdi
	jne loop

	movq $0, %rbx
	movq $1, %rax
	int $0x80
