BITS 64

%include "./lib/std.asm"

section .data
    test_string dw "We think in generalities, but we live in details."

section .text
    global _start

_start:
    ; Expected : 'We think in generalities, but we live in details.'
    _STD_SUBSTR test_string, 3, 5
    mov rsi, rax
    ; Expected : 'think\r\n'
    _STD_PRINTLN rsi
    ; Expected : echo $? -> 0
    _STD_EXIT 0