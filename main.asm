BITS 64

%include "stdlib/core.asm"

section .data
    data db "This is my file content", 0

section .bss
    filename_length equ __UCHAR * 10
    filename resb filename_length

section .text
    global _start

_start:
    ; Read filename
    mov rsi, filename
    mov rdx, filename_length
    call stdin

    ; Create the file.
    mov rdi, filename
    mov rsi, O_CREAT + O_WRONLY
    mov dx, 0644o
    call open

    ; Write the data into the file.
    mov rsi, data
    call write

    ; Close the file.
    call close

    ; Exit the program
	xor rdi, rdi
	call exit
    ret
