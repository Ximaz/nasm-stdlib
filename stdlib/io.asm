BITS 64

STDIN equ 0
STDOUT equ 1
STDERR equ 2

; --------------------------------------------------------------------------------
; (__INT read_bytes: rax) stdin(__CHAR *buffer: rsi,
;                                      __INT len: rdx);
; --------------------------------------------------------------------------------
stdin:
    mov di, STDIN
    mov ax, SYS_READ
    syscall
    dec rax               ; Handle the '\n' at the inputted string.
    mov [rsi+rax], byte 0 ; Puts a null byte at the '\n' position.
    retn

; --------------------------------------------------------------------------------
; (__INT written_bytes: rax) stdout(__CHAR *buffer: rsi);
; --------------------------------------------------------------------------------
stdout:
    call strlen
    mov rdx, rcx
    mov di, STDOUT
    mov ax, SYS_WRITE
    syscall
    retn

; --------------------------------------------------------------------------------
; (__INT written_bytes: rax) stderr(__CHAR *buffer: rsi);
; --------------------------------------------------------------------------------
stderr:
    call strlen
    mov rdx, rcx
    mov di, STDERR
    mov ax, SYS_WRITE
    syscall
    retn
