    section .data
    section .bss
    section .text

    global _start

    extern exit
    extern putchar

_start:
    mov rdi, 65
    call putchar

    mov rdi, 10
    call putchar
    
    xor edi, edi
    call exit
