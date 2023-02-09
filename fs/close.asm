    section .data
    section .bss
    section .text

    global close

close:
    mov ax, 3
    syscall
    ret
