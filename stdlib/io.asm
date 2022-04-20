BITS 64

STDIN equ 0
STDOUT equ 1
STDERR equ 2

; --------------------------------------------------------------------------------
; (unsigned int read_bytes: rax) stdin(char *buffer: rsi,
;                                      unsigned int length: rdx);
; --------------------------------------------------------------------------------
stdin:
    mov di, STDIN
    mov ax, SYS_READ
    syscall
    dec rax               ; Handle the '\n' at the inputted string.
    mov [rsi+rax], byte 0 ; Puts a null byte at the '\n' position.
    retn

; --------------------------------------------------------------------------------
; (unsigned int written_bytes: rax) stdout(char *buffer: rsi);
; --------------------------------------------------------------------------------
stdout:
    call strlen
    mov rdx, rcx
    mov di, STDOUT
    mov ax, SYS_WRITE
    syscall
    retn

; --------------------------------------------------------------------------------
; (unsigned int written_bytes: rax) stderr(char *buffer: rsi);
; --------------------------------------------------------------------------------
stderr:
    call strlen
    mov rdx, rcx
    mov di, STDERR
    mov ax, SYS_WRITE
    syscall
    retn
