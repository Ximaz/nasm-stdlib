BITS 64

; --------------------------------------------------------------------------------
; (__INT: rcx) strlen(__CHAR *buffer: rsi);
; --------------------------------------------------------------------------------
strlen:
    xor rcx, rcx                    ; __INT rcx = 0;
__strlen_counter:                   ; while (1) {
    inc rcx                         ;     rcx++
    cmp byte [rsi+rcx], 0           ;     if (rsi[rcx] != 0)
    jnz short __strlen_counterstart ;         continue;
    retn                            ;     break;
                                    ; }

; --------------------------------------------------------------------------------
; (__CHAR *substring: rax) substr(__CHAR *buffer: rsi, __INT start: rcx, __INT span: rdx);
; --------------------------------------------------------------------------------
substr:
    mov rax, rsi          ; rax = rsi
    add rax, rdx          ; rax = rax[rcx:]
    mov byte [rax+rcx], 0 ; rax = rax[:rcx+rdx]
    retn
