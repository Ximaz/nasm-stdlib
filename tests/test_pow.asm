BITS 64

%include "stdlib/core.asm"

section .text
    global _start


 _test_one:
    mov rsi, 10
    mov rdi, 2
    call pow
    ; Must not raise an error.
    mov rsi, rax ; source
    mov rdi, 100 ; mask
    mov al, ASSERT_EQU
    call assert
    retn

 _test_two:
    mov rsi, 10
    mov rdi, 4
    call pow
    ; Must not raise an error.
    mov rsi, rax   ; source
    mov rdi, 10000 ; mask
    mov al, ASSERT_EQU
    call assert
    retn

 _test_three:
    mov rsi, 2
    mov rdi, 8
    call pow
    ; Must not raise an error.
    mov rsi, rax ; source
    mov rdi, 256 ; mask
    mov al, ASSERT_EQU
    call assert
    retn

 _test_four:
    mov rsi, 2
    mov rdi, 0
    call pow
    ; Must not raise an error.
    mov rsi, rax ; source
    mov rdi, 1 ; mask
    mov al, ASSERT_EQU
    call assert
    retn

 _test_five:
    mov rsi, 2
    mov rdi, -1
    call pow
    ; Must not raise an error.
    mov rsi, rax ; source
    mov rdi, 0 ; mask
    mov al, ASSERT_EQU
    call assert
    retn

_start:
    call _test_one
    call _test_two
    call _test_three
    call _test_four
    call _test_five

    ; Exit the program
	xor dil, dil
	call exit
    retn
