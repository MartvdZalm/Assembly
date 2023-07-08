section .bss
    firstNumSize: equ 100
    firstNum: resb firstNumSize

    secondNumSize: equ 100
    secondNum: resb secondNumSize

section .data
    askForNumber: db "Enter a number: ", 0x0A
    askForNumberLength: equ $-askForNumber

section .text
    global _start

_start:
    ; Prompt for the first number
    mov rax, 1
    mov rdi, 1
    mov rsi, askForNumber
    mov rdx, askForNumberLength
    syscall

    ; Read the first number
    mov rax, 0
    mov rdi, 0
    mov rsi, firstNum
    mov rdx, firstNumSize
    syscall

    ; Prompt for the second number
    mov rax, 1
    mov rdi, 1
    mov rsi, askForNumber
    mov rdx, askForNumberLength
    syscall

    ; Read the second number
    mov rax, 0
    mov rdi, 0
    mov rsi, secondNum
    mov rdx, secondNumSize
    syscall

    ; Multiply needs to be added
    

    ; Exit the program
    mov rax, 60
    xor rdi, rdi
    syscall
