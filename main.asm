BITS 64

%include "stdlib/core.asm"

section .data
    debug_stage db "DEBUG", 0
    data db "This is my file content", 0

section .bss
    filename_length equ __UCHAR * 10
    filename resb filename_length
    data_length equ __UCHAR * 24
    file_data resb data_length

section .text
    global _start

_start:
create_file:
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
read_file:
    ; Open the file in read-only mode.
    mov rdi, filename
    mov rsi, O_RDONLY
    call open

    ; Read the file
    mov rsi, file_data
    mov rdx, data_length
    call read

    ; Close the file
    call close

print:
    ; Print the file data.
    call stdout
return:
    ; Exit the program
	xor dl, dl
	call exit
    retn
