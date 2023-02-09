    section .data
    section .bss
    section .text

    global exit

exit:
    mov ax, 60
    syscall
    ret
