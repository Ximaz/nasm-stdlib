BITS 64

%include "stdlib/core.asm"

section .data
    prompt_filename db "Enter a filename : ", 0
    data db "This is my file content", 0

section .bss
    filename_len equ __CHAR * 10
    filename resb filename_len
    data_len equ __CHAR * 24
    file_data resb data_len

section .text
    global _start

_create_file:
    ; Show the prompt
    mov rsi, prompt_filename
    call stdout

    ; Read filename
    mov rsi, filename
    mov rdx, filename_len
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
    retn

_read_file:
    ; Open the file in read-only mode.
    mov rdi, filename
    mov rsi, O_RDONLY
    call open

    ; Read the file
    mov rsi, file_data
    mov rdx, data_len
    call read

    ; Close the file
    call close
    retn

_start:
    call _create_file

    ; Pause the program for 5 seconds
    mov rcx, 5000
    call sleep

    call _read_file

    ; Print the file data.
    call stdout

    ; Exit the program
	xor dil, dil
	call exit
    retn
