BITS 64

; --------------------------------------------------------------------------------
; (__SIZE_T length: rcx) strlen(__CHAR *buffer: rsi);
;
; Description :
;
; Counts the length of the buffer (rsi) and returns the result into rcx.
; --------------------------------------------------------------------------------
strlen:
    xor rcx, rcx                    ; __SIZE_T rcx = 0;
__strlen_counter:                   ; while (1) {
    inc rcx                         ;     rcx++
    cmp byte [rsi+rcx], 0           ;     if (rsi[rcx] != 0)
    jnz short __strlen_counterstart ;         continue;
    retn                            ;     break;
                                    ; }

; --------------------------------------------------------------------------------
; (__CHAR *str: rax) substr(__CHAR *buffer: rsi, __SIZE_T start: rcx, __SIZE_T count: rdx);
;
; Description :
;
; Perform a substring from buffer (rsi) from start (rcx) and goes until count (rdx).
;
; The substring is stored into rax.
; --------------------------------------------------------------------------------
substr:
    mov rax, rsi          ; rax = rsi
    add rax, rdx          ; rax = rax[rcx:]
    mov byte [rax+rcx], 0 ; rax = rax[:rcx+rdx]
    retn
