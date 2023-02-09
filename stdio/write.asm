    section .data
    section .bss
    section .text

    global write

write:
    mov eax, 1
    syscall
    ret
