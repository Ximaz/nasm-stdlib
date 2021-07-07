BITS 64
default rel
%include "./syscalls_id.asm"

%macro _STD_IO_OUT 1
    lea rsi, [%1]
    push rax
    _STD_STRLEN rsi
    mov rdx, rax
    mov rax, SYS_WRITE
    mov rdi, 1
    syscall
    pop rax
%endmacro

%macro _STD_IO_IN 1
    push rsp
    mov rax, SYS_READ
    xor rdi, rdi
    mov rsi, rsp
    mov rdx, %1
    syscall
    pop rax
%endmacro

%macro _STD_IO_ERR 1
    _STD_PRINTLN %1
    _STD_EXIT 1
%endmacro