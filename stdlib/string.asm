BITS 64

; --------------------------------------------------------------------------------
; (unsigned int: rcx) strlen(char *buffer: rsi);
; --------------------------------------------------------------------------------
strlen:
    xor rcx, rcx               ; unsigned int rcx = 0;
__strlen_counter_start:        ; while (1) {
    inc rcx                    ;     rcx++
    cmp byte [rsi+rcx], 0      ;     if (rsi[rcx] != 0)
    jnz __strlen_counter_start ;         continue;
                               ;     else
__strlen_counter_end:          ;     {
    dec rcx                    ;         rcx--;
    ret                        ;         break;
                               ;     }
                               ; }

; --------------------------------------------------------------------------------
; (char *substring: rax) substr(char *buffer: rsi,
;                               unsigned int start: rbx,
;                               unsigned int span: rcx);
; --------------------------------------------------------------------------------
substr:
    mov rax, rsi          ; rax = rsi
    add rax, rbx          ; rax = rax[rbx:]
    mov [rax+rcx], word 0 ; rax = rax[:rbx+rcx]
    ret
