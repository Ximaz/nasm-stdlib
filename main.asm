    section .data
string: db `my_string`, 0
    section .bss
    section .text

    global _start

    extern exit
    extern puts
    extern putc

_start:
    mov rdi, 1
    mov rsi, string
    call puts

    mov rdi, 1
    mov rsi, 10
    call putc
    
    xor edi, edi
    call exit
