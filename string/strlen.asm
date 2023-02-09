    section .data
    section .bss
    section .text

    global strlen

strlen:
    xor rax, rax

    .while:
    cmp byte [rdi*1+rax], 0
    jnz .continue

    ret

    .continue:
    inc rax
    jmp .while
