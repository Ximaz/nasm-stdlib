BITS 64
default rel
section .data
    NEW_LINE db 0xa, 0x0

global _std_strlen_loop
section .text

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

%macro _STD_PRINTLN 1
    _STD_IO_OUT %1
    _STD_IO_OUT NEW_LINE
%endmacro

%macro _STD_SUBSTR 3
    lea rax, [%1]
    add rax, %2
    mov [rax+%3], word 0
%endmacro

%macro _STD_EXIT 1
    mov rax, 60
    mov rdi, %1
    syscall
%endmacro

%include "./io.asm"
%include "./stream.asm"