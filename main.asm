BITS 64

%include "stdlib/core.asm"

section .data
    data db "This is my file content", 0

section .bss
    filename_length equ 10
    filename resb filename_length

section .text
    global _start

_start:
    ; Read filename
    mov rsi, filename
    mov rdx, filename_length
    call stdin

    ; Create the file.
    lea rdi, [filename]
    mov rsi, O_CREAT+O_DIRECTORY
    mov rdx, 0664o
    call open

    ; Store the file descriptor.
    mov rdi, rax

    ; Write the data into the file.
    mov rsi, data
    call write

    ; Close the file.
    call close

    ; Exit the program
	xor rdi, rdi
	call exit
    ret
