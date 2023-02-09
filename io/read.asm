    section .data
    section .bss
    section .text

    global read

read:
    mov ax, 0
    syscall
    ret
