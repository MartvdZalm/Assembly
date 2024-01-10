.section .data
output:
    .string "Hello World!!!"

.section .text
.globl main
.type main, @function
main:
	pushq $output
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
    	movq 16(%rbp), %rax
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

	pushq 16(%rbp)
	call length	

	movq 16(%rbp), %rsi
	movq %rcx, %rdx
	syscall
	
	movq %rbp, %rsp
	pop %rbp
	ret
