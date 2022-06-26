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
    jnz __strlen_counter ;         continue;
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
; (__INT equality al) strcmp(__CHAR *s1: rsi, __CHAR s2: rdi);
;
; Description :
;
; Perform a string comparison between two buffers. If both are equals, the function
; returns 0. Else, it returns the difference between both character it stopped by.
;
; The equality statement is stored into al.
; --------------------------------------------------------------------------------
strcmp:
    xor rax, rax           ; size_t rax = 0;
    xor cl, cl             ; char cl;
__strcmp_while:            ; while (1) {
    mov cl, [rsi+rax]      ;    cl = rsi[rax];
    cmp cl, 0              ;    if (cl == 0)
    je __strcmp_ret_value  ;        return strcmp_ret_value(rsi, rdi, rax);
    cmp byte [rdi+rax], 0  ;    if (rdi[rax] == 0)
    je __strcmp_ret_value  ;        return strcmp_ret_value(rsi, rdi, rax);
    cmp byte [rdi+rax], cl ;    if (rdi[rax] != cl)
    jne __strcmp_ret_value ;        return strcmp_ret_value(rsi, rdi, rax);
    inc rax                ;    rax++;
    jmp __strcmp_while     ; }
__strcmp_ret_value:
    mov cl, [rsi+rax]      ; char cl = rsi[rax];
    sub cl, byte [rdi+rax] ; cl -= rdi[rax];
    mov al, cl             ; rax = cl;
    retn                   ; return rax;
