.section .data

.LC0:
	.string "Hello World"

.section .text
.globl main
.type main, @function
main:
#	xor %rdi, %rdi
	leaq .LC0(%rip), %r9
#	pushq $.LC0
	call print

	movq $60, %rax
	syscall

.globl length
.type length, @function
length:
    	pushq %rbp
	pushq %rax
    	movq %rsp, %rbp

    	xor %rcx, %rcx
    	movq %rdi, %rax
loop:
    	movb (%rax), %dl
    	test %dl, %dl  
    	jz end_loop

    	inc %rcx 
    	inc %rax 
   	jmp loop
end_loop:
	popq %rax
	popq %rbp
	
   	ret	

.globl print
.type print, @function
print:
	pushq %rbp
	movq %rsp, %rbp	

	movq $1, %rax
	movq %r9, %rsi
#	movq 16(%rbp), %rsi
#	leaq .LC0(%rip), %rsi
	movq $11, %rdx
	syscall
	
	movq %rbp, %rsp
	pop %rbp
	ret
