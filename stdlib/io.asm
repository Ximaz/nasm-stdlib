BITS 64

STDIN equ 0
STDOUT equ 1
STDERR equ 2

; --------------------------------------------------------------------------------
; (char *buffer: rax) stdin(unsigned int length: rdx);
; --------------------------------------------------------------------------------
stdin:
    mov rdi, STDIN
    mov rax, SYS_READ
    sub rsp, rdx
    mov rsi, rsp
    syscall
    add rsp, rdx
    lea rax, [rsi]
    ret

; --------------------------------------------------------------------------------
; void stdout(char const *buffer: rsi);
; --------------------------------------------------------------------------------
stdout:
    call strlen
    mov rdx, rcx
    mov rdi, STDOUT
    mov rax, SYS_WRITE
    syscall
    ret

; --------------------------------------------------------------------------------
; void stderr(char const *buffer: rsi);
; --------------------------------------------------------------------------------
stderr:
    call strlen
    mov rdx, rcx
    mov rdi, STDERR
    mov rax, SYS_WRITE
    syscall
    ret
