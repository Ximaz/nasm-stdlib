BITS 64

ASSERT_EQU equ 1
ASSERT_STR_EQU equ 2
ASSERT_NOT_EQU equ 3
ASSERT_NOT_STR_EQU equ 4
section .data
    assert_failure db "Failure : ", 0
    assert_succeed db "OK !", 0
    assert_not_equ_symbol db 34, " != ", 34, 0
    assert_equ_symbol db 34, " == ", 34, 0
    assert_invalid_flag db "Invalid flag was provided for assertion.", 10, 0
    assert_equ_not_ok db "values are not the same.", 10, 0
    assert_not_equ_not_ok db "values are the same.", 10, 0
    quote db 34, 0
    new_line db 10, 0

section .text

; --------------------------------------------------------------------------------
; (_INT ok al) assert(_ASSERT_FLAG flag: al, void *d1: rsi, void *d2: rdi);
;
; Description :
;
; Perform an assert verification using an assert flag which will be used to compute
; between two pointers. The result is stored to the al register. An error string is
; printed if both pointer are not matching the assert flag. 1 is return if it's the
; case. 0 is return if all was ok.
;
; In order to know which test failed, you may print the test ID/name before calling
; the assert method.
; --------------------------------------------------------------------------------
assert:
    cmp al, ASSERT_EQU
    je _assert_equ
    cmp al, ASSERT_STR_EQU
    je _assert_str_equ
    cmp al, ASSERT_NOT_EQU
    je _assert_not_equ
    cmp al, ASSERT_NOT_STR_EQU
    je _assert_not_str_equ
    jmp _assert_invalid_flag
_assert_prepare_failure:
    push rsi
    push rdi
    mov rsi, assert_failure
    call stderr
    pop rdi
    pop rsi
    retn
_assert_prepare_success:
    mov rsi, assert_succeed
    call stdout
    mov rsi, new_line
    call stdout
    retn
_assert_equ:
    cmp rsi, rdi
    jnz _assert_equ_not_ok
    call _assert_prepare_success
    xor al, al
    retn
_assert_str_equ:
    call strcmp
    cmp al, 0
    jnz _assert_str_equ_not_ok
    call _assert_prepare_success
    retn
_assert_not_equ:
    cmp rsi, rdi
    je _assert_not_equ_not_ok
    call _assert_prepare_success
    xor al, al
    retn
_assert_not_str_equ:
    call strcmp
    cmp al, 0
    je _assert_not_str_equ_not_ok
    call _assert_prepare_success
    retn
_assert_invalid_flag:
    mov rsi, assert_invalid_flag
    call stderr
    mov al, 1
    retn
_assert_equ_not_ok:
    call _assert_prepare_failure
    mov rsi, assert_equ_not_ok
    call stderr
    mov al, 1
    retn
_assert_str_equ_not_ok:
    call _assert_prepare_failure
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
_assert_not_equ_not_ok:
    call _assert_prepare_failure
    mov rsi, assert_not_equ_not_ok
    call stderr
    mov al, 1
    retn
_assert_not_str_equ_not_ok:
    call _assert_prepare_failure
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
