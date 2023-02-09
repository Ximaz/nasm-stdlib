    section .data
s1: db `string`, 0
s2: db `stringX`, 0
    section .bss
    section .text

    global _start

    extern exit
    extern puts
    extern substr
    extern putc
    extern strlen
    extern strcmp

_start:
    mov rdi, s1
    mov rsi, s2
    call strcmp

    mov rsi, rax
    add rsi, 48
    mov rdi, 1
    call putc

    xor edi, edi
    call exit
