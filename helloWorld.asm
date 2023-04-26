section .data
    msg db "Hello World", 0x0A
    msgLength equ $-msg

section .text
    global _start

_start:
    mov eax, 1      
    mov edi, 1      
    mov rsi, msg    
    mov edx, msgLength
    syscall         

    mov eax, 60     
    xor edi, edi    
    syscall        
