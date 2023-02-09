    section .data
    section .bss
    section .text

    global read

read:
    mov eax, 0
    syscall
    ret
