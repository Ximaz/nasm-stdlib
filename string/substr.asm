    section .data
    section .bss
    section .text

    global substr

substr:
    push rdi
    pop rax
    add rax, rsi
    mov byte [rax*1+rdx], 0
    ret
