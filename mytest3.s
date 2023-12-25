.section .data
values:
	.int 10, 20, 30, 40, 50, 60, 70, 80, 90, 100

.section .text
.globl _start
_start:
	movl $values, %esi
	movl $10, %ecx
	movl $10, %ebx
loop:
	movl (%esi), %eax
	cmp %eax, 4(%esi)
	jle skip
	xchg %eax, 4(%esi)
	movl %eax, (%esi)
skip:
	add $4, %esi
	dec %ebx
	jnz loop
	dec %ecx
	jz end
	movl $values, %esi
	movl %ecx, %ebx
	jmp loop
end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
