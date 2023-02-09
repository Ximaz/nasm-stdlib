    section .data
    section .bss
    section .text

    global open

open:
    mov eax, 2
    syscall
    ret
