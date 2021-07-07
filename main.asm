BITS 64

%include "./stdlib/core.asm"

section .data
    ; test_string db "We think in generalities, but we live in details.",0xd,0xa,0x0
    test_string db "T",0x0
    filename db "filename.txt",0x0
section .text
    global _start
_create_file:
    _STD_STREAM_CREATE filename
_start:
    _STD_STREAM_OPEN filename, _SF_READ_AND_WRITE, 0777o
    cmp rax, _STD_STREAM_ERR_OPEN
    jz _create_file

    _STD_STREAM_WRITE rax, test_string
    _STD_STREAM_SET_CURSOR_TO rax, 0
    push rax
    _STD_STREAM_READ rax, 0xfff
    _STD_PRINTLN rax
    pop rax
    _STD_STREAM_CLOSE rax

    _STD_EXIT 0