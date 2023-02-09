    section .data
    section .bss
    section .text

    global exit

exit:
    mov eax, 60
    syscall
    ret
