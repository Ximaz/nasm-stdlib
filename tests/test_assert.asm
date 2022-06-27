BITS 64

%include "stdlib/core.asm"

section .data
    s1 db "Ceci est une phrase", 0
    s2 db "Ceci est une phrase", 0
    test_one db "TestNumberOne:", 0

section .text
    global _start

_test_one:
    mov rsi, test_one
    call stdout
    ; Must raise an error. s1 == s2
    mov al, ASSERT_NOT_STR_EQU
    mov rsi, s1 ; source
    mov rdi, s2 ; mask
    call assert
    retn

_start:
    call _test_one

    ; Exit the program
	xor dil, dil
	call exit
    retn
