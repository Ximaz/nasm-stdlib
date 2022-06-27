BITS 64

; --------------------------------------------------------------------------------
; (_INT result rax) multiply(_INT number: rsi, _INT by: rdi);
;
; Description :
;
; Compute the multiplication of number (rsi) by (rdi). The result is stored in rax
; register.
; --------------------------------------------------------------------------------
multiply:
    xor rax, rax
_do_multiply:
    cmp rdi, 0
    jle _multiply_ret_value
    add rax, rsi
    dec rdi
    jmp _do_multiply
_multiply_ret_value:
    retn

; --------------------------------------------------------------------------------
; (_INT result rax) devide(_INT number: rsi, _INT by: rdi);
;
; Description :
;
; Compute the division of number (rsi) by (rdi). The result is stored in rax
; register. If there is a division error, the rax register is unchanged.
; --------------------------------------------------------------------------------
divide:
    cmp rdi, 0
    je _devide_ret_value  ; Division by 0 error.
    xor rax, rax
_do_devide:
    cmp rsi, rdi
    jl _devide_ret_value
    sub rsi, rdi
    inc rax
    jmp _do_devide
_devide_ret_value:
    retn

; --------------------------------------------------------------------------------
; (_INT result rax) modulo(_INT number: rsi, _INT by: rdi);
;
; Description :
;
; Compute the modulo of number (rsi) by (rdi). The result is stored in rax
; register. If there is a modulo error, the rax register is unchanged.
; --------------------------------------------------------------------------------
modulo:
    cmp rdi, 0
    je _modulo_ret_value  ; Modulo by 0 error.
    xor rax, rax
_do_modulo:
    cmp rsi, rdi
    jl _modulo_ret_value
    sub rsi, rdi
    jmp _do_modulo
_modulo_ret_value:
    mov rax, rsi
    retn

; --------------------------------------------------------------------------------
; (_INT result rax) pow(_INT number: rsi, _INT pow: rdi);
;
; Description :
;
; Compute the power of pow (rdi) over number (rsi) as number^pow. Result is stored
; in rax register.
; --------------------------------------------------------------------------------
pow:
    xor rax, rax
    cmp rdi, 0
    jl _pow_ret_value
    inc rax
_pow_comparator:
    cmp rdi, 0
    je _pow_ret_value
    dec rdi
    push rdi
    push rsi
    mov rdi, rsi
    mov rsi, rax
    call multiply
    pop rsi
    pop rdi
    jmp _pow_comparator
_pow_ret_value:
    retn
