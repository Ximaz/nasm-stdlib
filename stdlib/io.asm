BITS 64

STDIN equ 0
STDOUT equ 1
STDERR equ 2

; --------------------------------------------------------------------------------
; (_INT read_bytes: rax) stdin(_CHAR *buffer: rsi, _INT len: rdx);
;
; Description :
;
; Write into the specified buffer (rsi) n bytes (len: rdx) from the standard input.
; --------------------------------------------------------------------------------
stdin:
    mov edi, STDIN
    call read
    cmp byte [rsi+rax-1], 10
    je _stdin_trim_newline
    mov [rsi+rax], byte 0
    retn
_stdin_trim_newline:
    dec rax               ; Handle the '\n' at the inputted string.
    mov [rsi+rax], byte 0 ; Puts a null byte at the '\n' position.
    retn

; --------------------------------------------------------------------------------
; (_INT written_bytes: rax) stdout(_CHAR *buffer: rsi);
;
; Description :
;
; Write the specified buffer (rsi) into the standard output.
; --------------------------------------------------------------------------------
stdout:
    mov edi, STDOUT
    call write
    retn

; --------------------------------------------------------------------------------
; (_INT written_bytes: rax) stderr(_CHAR *buffer: rsi);
;
; Description :
;
; Write the specified buffer (rsi) into the standard error.
; --------------------------------------------------------------------------------
stderr:
    mov edi, STDERR
    call write
    retn
