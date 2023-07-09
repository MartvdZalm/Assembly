section .bss
    size: equ 10

    age: resb size
    legalAge: resb size

section .data
    legalAgeString: db "Enter the legal age: "
    legalAgeStringLength: equ $-legalAgeString

    ageString: db "Enter you're age: "
    ageStringLength: equ $-ageString

    canEnterString: db "You can enter!", 0x0A
    canEnterStringLength: equ $-canEnterString

    tooYoungString: db "You're too young. You can't enter!", 0x0A
    tooYoungStringLength: equ $-tooYoungString

    equalString: db "You're lucky, you're equal the required age!", 0x0A
    equalStringLength: equ $-equalString

section .text
    global _start 

_start:
    ; Prompt for the legal age
    mov rax, 1
    mov rdi, 1
    mov rsi, legalAgeString
    mov rdx, legalAgeStringLength
    syscall

    ; Read the legal age
    mov rax, 0
    mov rdi, 0
    mov rsi, legalAge
    mov rdx, size
    syscall

    ; Prompt for the age
    mov rax, 1
    mov rdi, 1
    mov rsi, ageString
    mov rdx, ageStringLength
    syscall

    ; Read the first number
    mov rax, 0
    mov rdi, 0
    mov rsi, age
    mov rdx, size
    syscall

    ; Compare the numbers
    mov eax, dword [age]
    mov ebx, dword [legalAge]
    cmp eax, ebx

    je equal_case   
    jg greater_than_case
    jl less_than_case
    jmp end_if_statement

equal_case: ; age == legalAge
    mov rax, 1  
    mov rdi, 1  
    mov rsi, equalString
    mov rdx, equalStringLength
    syscall

    jmp end_if_statement

greater_than_case: ; age > legalAge
    mov rax, 1  
    mov rdi, 1  
    mov rsi, canEnterString
    mov rdx, canEnterStringLength
    syscall

    jmp end_if_statement

less_than_case: ; age < legalAge
    mov rax, 1  
    mov rdi, 1  
    mov rsi, tooYoungString
    mov rdx, tooYoungStringLength
    syscall

    jmp end_if_statement

end_if_statement:

    ; Exit the program
    mov rax, 60
    xor rdi, rdi
    syscall
