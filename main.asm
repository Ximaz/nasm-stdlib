BITS 64

%include "stdlib/core.asm"

section .data
    data db "This is my file content", 0

section .bss
    filename_len equ __UCHAR * 10
    filename resb filename_len
    data_len equ __UCHAR * 24
    file_data resb data_len

section .text
    global _start

_start:
create_file:
    ; Read filename
    mov rsi, filename
    mov rdx, filename_len
    call stdin

    ; Create the file.
    mov rdi, filename
    mov rsi, O_CREAT + O_WRONLY
    mov dx, 0644o
    call open

    ; Write the data __INTo the file.
    mov rsi, data
    call write

    ; Close the file.
    call close
read_file:
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

pr__INT:
    ; Pr__INT the file data.
    call stdout
return:
    ; Exit the program
	xor dl, dl
	call exit
    retn
