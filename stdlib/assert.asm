BITS 64

ASSERT_EQU equ 1
ASSERT_STR_EQU equ 2
ASSERT_NOT_EQU equ 3
ASSERT_NOT_STR_EQU equ 4
section .data
    assert_failure db " failed: ", 0
    assert_not_equ_symbol db 34, " != ", 34, 0
    assert_equ_symbol db 34, " == ", 34, 0
    assert_invalid_flag db "Invalid flag was provided for assertion.", 10, 0
    assert_equ_not_ok db "values are not the same.", 10, 0
    assert_not_equ_not_ok db "values are the same.", 10, 0
    quote db 34, 0
    new_line db 10, 0

section .text

; --------------------------------------------------------------------------------
; (__INT ok al) assert(__ASSERT_FLAG flag: al, void *d1: rsi, void *d2: rdi, __CHAR *assert_name: rdx);
;
; Description :
;
; Perform an assert verification using an assert flag which will be used to compute
; between two pointers. The result is stored to the al register. An error string is
; printed if both pointer are not matching the assert flag. 1 is return if it's the
; case. 0 is return if all was ok. The assert name (rdx) will be used to be prompt
; on the stderr if an error occured to let the programmer know which test failed.
; --------------------------------------------------------------------------------
assert:
    cmp al, ASSERT_EQU
    je __assert_equ
    cmp al, ASSERT_STR_EQU
    je __assert_str_equ
    cmp al, ASSERT_NOT_EQU
    je __assert_not_equ
    cmp al, ASSERT_NOT_STR_EQU
    je __assert_not_str_equ
    jmp __assert_invalid_flag
__assert_prepare_failure:
    push rsi
    push rdi
    mov rsi, rdx
    call stderr
    mov rsi, assert_failure
    call stderr
    pop rdi
    pop rsi
    retn
__assert_equ:
    cmp rsi, rdi
    jnz __assert_equ_not_ok
    xor al, al
    retn
__assert_str_equ:
    call strcmp
    cmp al, 0
    jnz __assert_str_equ_not_ok
    retn
__assert_not_equ:
    cmp rsi, rdi
    je __assert_not_equ_not_ok
    xor al, al
    retn
__assert_not_str_equ:
    call strcmp
    cmp al, 0
    je __assert_not_str_equ_not_ok
    retn
__assert_invalid_flag:
    mov rsi, assert_invalid_flag
    call stderr
    mov al, 1
    retn
__assert_equ_not_ok:
    call __assert_prepare_failure
    mov rsi, assert_equ_not_ok
    call stderr
    mov al, 1
    retn
__assert_str_equ_not_ok:
    call __assert_prepare_failure
    push rdi
    push rsi
    mov rsi, quote
    call stderr
    pop rsi
    call stderr
    mov rsi, assert_not_equ_symbol
    call stderr
    pop rsi
    call stderr
    mov rsi, quote
    call stderr
    mov rsi, new_line
    call stderr
    mov al, 1
    retn
__assert_not_equ_not_ok:
    call __assert_prepare_failure
    mov rsi, assert_not_equ_not_ok
    call stderr
    mov al, 1
    retn
__assert_not_str_equ_not_ok:
    call __assert_prepare_failure
    push rdi
    push rsi
    mov rsi, quote
    call stderr
    pop rsi
    call stderr
    mov rsi, assert_equ_symbol
    call stderr
    pop rsi
    call stderr
    mov rsi, quote
    call stderr
    mov rsi, new_line
    call stderr
    mov al, 1
    retn
