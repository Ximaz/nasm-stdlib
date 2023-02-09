    section .data
    section .bss
    section .text

    global close

close:
    mov eax, 3
    syscall
    ret
