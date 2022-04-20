BITS 64

STDIN equ 0
STDOUT equ 1
STDERR equ 2

; --------------------------------------------------------------------------------
; (unsigned int const read_bytes: rax) stdin(char *buffer: rsi,
;                                            unsigned int const length: rdx);
; --------------------------------------------------------------------------------
stdin:
    mov rdi, STDIN
    mov rax, SYS_READ
    syscall
    dec rax
    mov [rsi+rax], byte 0
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
