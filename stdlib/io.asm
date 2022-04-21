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
    call read
    cmp byte [rsi+rax-1], 10
    je __stdin_trim_newline
    mov [rsi+rax], byte 0
    retn
__stdin_trim_newline:
    dec rax               ; Handle the '\n' at the inputted string.
    mov [rsi+rax], byte 0 ; Puts a null byte at the '\n' position.
    retn

; --------------------------------------------------------------------------------
; (__INT written_bytes: rax) stdout(__CHAR *buffer: rsi);
; --------------------------------------------------------------------------------
stdout:
    mov di, STDOUT
    call write
    retn

; --------------------------------------------------------------------------------
; (__INT written_bytes: rax) stderr(__CHAR *buffer: rsi);
; --------------------------------------------------------------------------------
stderr:
    mov di, STDERR
    call write
    retn
