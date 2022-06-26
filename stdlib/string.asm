BITS 64

; --------------------------------------------------------------------------------
; (__SIZE_T length: rcx) strlen(__CHAR *buffer: rsi);
;
; Description :
;
; Counts the length of the buffer (rsi) and returns the result into rcx.
; --------------------------------------------------------------------------------
strlen:
    xor rcx, rcx               ; __SIZE_T rcx = 0;
__strlen_counter:              ; while (1) {
    inc rcx                    ;     rcx++
    cmp byte [rsi+rcx], 0      ;     if (rsi[rcx] != 0)
    jnz short __strlen_counter ;         continue;
    retn                       ;     break;
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


; --------------------------------------------------------------------------------
; (int equality al) strcmp(__CHAR *s1: rsi, __CHAR s2: rdi);
;
; Description :
;
; Perform a string comparison between two buffers. If both are equals, the function
; returns 0. Else, it returns the difference between both character it stopped by.
;
; The equality statement is stored into al.
; --------------------------------------------------------------------------------
strcmp:
    xor rax, rax ; char index
    xor cl, cl   ; s1[rax]
__strcmp_while:
    mov cl, [rsi+rax]
    cmp cl, 0
    je short __strcmp_ret_value
    cmp byte [rdi+rax], 0
    je short __strcmp_ret_value
    cmp byte [rdi+rax], cl
    jne short __strcmp_ret_value
    inc rax
    jmp short __strcmp_while
__strcmp_ret_value:
    mov cl, [rsi+rax]
    mov ch, [rdi+rax]
    sub cl, ch
    mov al, cl
    retn
