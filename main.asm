    section .data
filename: db `filename.txt`, 0
content:  db `Content to write\n`, 0
length:   equ $ - content
    section .bss
    section .text

    global _start

    extern exit
    extern write
    extern open
    extern close
    extern O_CREAT, O_WRONLY

_start:
    mov rdi, filename
    mov rsi, O_CREAT
    add rsi, O_WRONLY
    mov dx,  0644o
    call open

    mov rdi, rax
    mov rsi, content
    mov rdx, length
    call write

    call close
    
    xor edi, edi
    call exit
