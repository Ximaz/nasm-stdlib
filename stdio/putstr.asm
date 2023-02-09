    section .data
    section .bss
    section .text

    global puts
    global putstr

    extern write
    extern strlen

puts:
    push rdi
    mov rdi, rsi
    call strlen
    pop rdi
    mov rdx, rax
    call write
    ret

putstr:
    push rdi
    call strlen
    mov rdx, rax
    mov rdi, 1
    mov rsi, [rsp]
    call write
    pop rdi
    ret
