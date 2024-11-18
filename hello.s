.global _start
.intel_syntax noprefix

_start:
    
    // sys_write
    mov rax, 1
    mov rdi, 1
    lea rsi, [hello_world]
    mov rdx, 14
    syscall

    // sys_write
    mov rax, 1
    mov rdi, 1
    lea rsi, [asm_sucks]
    mov rdx, 13
    syscall

    // sys_exit
    mov rax, 60
    mov rdi, 25
    syscall

hello_world:
    .asciz "Hello, World!\n"

asm_sucks:
    .asciz "ASM Sucks :c\n"
