BITS 64

; --------------------------------------------------------------------------------
; (unsigned int: rcx) strlen(char const *buffer: rsi);
; --------------------------------------------------------------------------------
strlen:
    xor rcx, rcx               ; rcx = 0
__strlen_counter_start:        ; while (1) {
    inc rcx                    ;     rcx++
    cmp byte [rsi+rcx], 0      ;     if (rsi[rcx] != 0)
    jnz __strlen_counter_start ;         continue
                               ;     else
    jz __strlen_counter_end    ;         break
                               ; }
__strlen_counter_end:
    ret

; --------------------------------------------------------------------------------
; (char *substring: rax) substr(char const *buffer: rsi,
;                               unsigned int const start: rbx,
;                               unsigned int const span: rcx);
; --------------------------------------------------------------------------------
substr:
    mov rax, rsi          ; rax = rsi
    add rax, rbx          ; rax = rax[rbx:]
    mov [rax+rcx], word 0 ; rax = rax[:rbx+rcx]
    ret
