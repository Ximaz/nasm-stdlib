    section .data
    section .bss
    section .text

    global open

open:
    mov ax, 2
    syscall
    ret
