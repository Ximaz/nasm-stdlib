BITS 64

%include "./syscalls_id.asm"

default rel

section .data
    NEW_LINE db 0xd, 0xa, 0x0

%macro _STD_STRLEN 1
    lea r8, [%1]
    xor rax, rax
    jmp %%_std_strlen_loop
    %%_std_strlen_loop:
        inc rax
        mov cl, [r8+rax]
        cmp cl, 0
        jnz %%_std_strlen_loop
%endmacro

%macro _STD_STDOUT 1
    mov rsi, %1
    _STD_STRLEN rsi
    mov rdx, rax
    mov rax, SYS_WRITE
    mov rdi, 1
    syscall
%endmacro

%macro _STD_PRINTLN 1
    _STD_STDOUT %1
    _STD_STDOUT NEW_LINE
%endmacro

%macro _STD_STDIN 1
    mov rdx, %1
    push rsp
    mov rax, SYS_READ
    xor rdi, rdi
    mov rsi, rsp
    syscall
    mov rax, rsp
%endmacro

%macro _STD_SUBSTR 3
    lea rax, [%1]
    add rax, %2
    push rax
    _STD_STRLEN rax
    mov r8, rax
    pop rax
    mov r8, %3
    mov [rax+r8], word 0
    lea rax, [rax]
%endmacro

%macro _STD_EXIT 1
    mov rax, 60
    mov rdi, %1
    syscall
%endmacro