    section .data
    section .bss
    section .text

    global putchar

    extern write

putchar:
    push rdi
    lea rsi, [rsp]
    mov edi, 1
    mov dx, 1
    call write
    pop rdi
    ret
