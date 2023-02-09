    section .data
    section .bss
    section .text

    global putc
    global putchar

    extern write

putc:
    push rsi
    lea rsi, [rsp]
    mov rdx, 1
    call write
    pop rsi
    ret
    
putchar:
    push rdi
    lea rsi, [rsp]
    mov edi, 1
    mov rdx, 1
    call write
    pop rdi
    ret
