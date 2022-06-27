BITS 64

; --------------------------------------------------------------------------------
; (_SIZE_T length: rcx) strlen(_CHAR *buffer: rsi);
;
; Description :
;
; Counts the length of the buffer (rsi) and returns the result into rcx.
; --------------------------------------------------------------------------------
strlen:
    xor rcx, rcx               ; _SIZE_T rcx = 0;
_strlen_counter:              ; while (1) {
    inc rcx                    ;     rcx++
    cmp byte [rsi+rcx], 0      ;     if (rsi[rcx] != 0)
    jnz _strlen_counter       ;         continue;
    retn                       ;     break;
                               ; }

; --------------------------------------------------------------------------------
; (_CHAR *str: rax) substr(_CHAR *buffer: rsi, _SIZE_T start: rcx, _SIZE_T count: rdx);
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
; (_INT equality al) strcmp(_CHAR *s1: rsi, _CHAR s2: rdi);
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
_strcmp_while:            ; while (1) {
    mov cl, [rsi+rax]      ;    cl = rsi[rax];
    cmp cl, 0              ;    if (cl == 0)
    je _strcmp_ret_value  ;        goto _strcmp_ret_value;
    cmp byte [rdi+rax], 0  ;    if (rdi[rax] == 0)
    je _strcmp_ret_value  ;        goto _strcmp_ret_value;
    cmp byte [rdi+rax], cl ;    if (rdi[rax] != cl)
    jne _strcmp_ret_value ;        goto _strcmp_ret_value;
    inc rax                ;    rax++;
    jmp _strcmp_while     ; }
_strcmp_ret_value:
    mov cl, [rsi+rax]      ; char cl = rsi[rax];
    sub cl, byte [rdi+rax] ; cl -= rdi[rax];
    mov al, cl             ; rax = cl;
    retn                   ; return rax;
