BITS 64

; --------------------------------------------------------------------------------
; (unsigned int: rcx) strlen(char *buffer: rsi);
; --------------------------------------------------------------------------------
strlen:
    xor rcx, rcx                     ; unsigned int rcx = 0;
__strlen_counter_start:              ; while (1) {
    inc rcx                          ;     rcx++
    cmp byte [rsi+rcx], 0            ;     if (rsi[rcx] != 0)
    jnz short __strlen_counter_start ;         continue;
__strlen_counter_end:                ;
    ret                              ;     break;
                                     ; }

; --------------------------------------------------------------------------------
; (char *substring: rax) substr(char *buffer: rsi,
;                               unsigned int start: rcx,
;                               unsigned int span: rdx);
; --------------------------------------------------------------------------------
substr:
    mov rax, rsi          ; rax = rsi
    add rax, rdx          ; rax = rax[rcx:]
    mov byte [rax+rcx], 0 ; rax = rax[:rcx+rdx]
    ret
