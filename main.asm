BITS 64

%include "stdlib/core.asm"

section .data
    filename db "my_file.txt", 0
    data db "This is my file content", 0

section .text
    global _start

_start:
    ; Create the file.
    mov rdi, filename
    mov rsi, O_CREAT+O_WRONLY
    mov rdx, 0664o
    call open

    ; Store the fd.
    mov rdi, rax

    ; Write the data into the file.
    mov rsi, data
    call write

    ; Close the file.
    call close

    ; Create the file.
    mov rdi, filename
    mov rsi, O_RDONLY
    mov rdx, 0664o
    call open

    ; Store the fd.
    mov rdi, rax

    ; Read the data into the file.
    mov rdx, 32
    call read

    ; Store the data into rsi.
    mov rsi, rax

    ; Display the data.
    call stdout

    ; Close the file.
    call close

    ; Exit the program.
	xor rdi, rdi
	call exit
    ret
