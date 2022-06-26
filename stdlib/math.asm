BITS 64

; --------------------------------------------------------------------------------
; (__INT result rax) multiply(__INT number: rsi, __INT by: rdi);
;
; Description :
;
; Compute the multiplication of number (rsi) by (rdi). The result is stored in rax
; register.
; --------------------------------------------------------------------------------
multiply:
    xor rax, rax
__do_multiply:
    cmp rdi, 0
    jle __multiply_ret_value
    add rax, rsi
    dec rdi
    jmp __do_multiply
__multiply_ret_value:
    retn

; --------------------------------------------------------------------------------
; (__INT result rax) pow(__INT number: rsi, __INT pow: rdi);
;
; Description :
;
; Compute the power of pow (rdi) over number (rsi) as number^pow. Result is stored
; in rax register.
; --------------------------------------------------------------------------------
pow:
    xor rax, rax
    cmp rdi, 0
    jl __pow_ret_value
    inc rax
__pow_comparator:
    cmp rdi, 0
    je __pow_ret_value
    dec rdi
    push rdi
    push rsi
    mov rdi, rsi
    mov rsi, rax
    call multiply
    pop rsi
    pop rdi
    jmp __pow_comparator
__pow_ret_value:
    retn
