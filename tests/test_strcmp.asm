BITS 64

%include "stdlib/core.asm"

section .data
    s1 db "Ceci est une phrase", 0
    s2 db "Ceci est une phras~", 0
    is_equal db "String one is equal to string two.", 10, 0
    is_less db "String one is less than string two.", 10, 0
    is_greater db "String one is greater than string two.", 10, 0

section .text
    global _start

_start:
    mov rsi, s1 ; source
    mov rdi, s2 ; mask
    call strcmp

    cmp al, 0
    je _is_equal
    jl _is_less
    jg _is_greater

_is_equal:
    mov rsi, is_equal
    jmp _ending
_is_less:
    mov rsi, is_less
    jmp _ending
_is_greater:
    mov rsi, is_greater
    jmp _ending
_ending:
    call stdout

    ; Exit the program
	xor dil, dil
	call exit
    retn
