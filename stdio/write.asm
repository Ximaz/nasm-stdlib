    section .data
    section .bss
    section .text

    global write

write:
    mov ax, 1
    syscall
    ret
