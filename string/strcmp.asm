    section .data
    section .bss
    section .text

    global strcmp

strcmp:
    xor r8, r8
    xor rax, rax

    .while:
    mov r8b, byte [rdi*1+rax]
    cmp r8b, 0
    jz .substract

    cmp byte [rsi*1+rax], 0
    jz .substract

    cmp byte [rsi*1+rax], r8b
    jnz .substract

    inc rax
    jmp .while

    .substract:
    cmp r8b, byte [rsi*1+rax]
    jl .lower
    jg .greater

    xor rax, rax
    ret

    .greater:
    xor rax, rax
    inc rax
    ret

    .lower:
    xor rax, rax
    dec rax
    ret
