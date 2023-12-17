# calculations.s - Random file with some calculations

.section .data
born:
	.int 2006
current:
	.int 2024

.section .text
.globl _start

_start:
	movq born, %rax
	subq %rax, (current)

	movq $1, %rax
	movq $0, %rbx
	int $0x80
