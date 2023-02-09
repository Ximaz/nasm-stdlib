    section .data
O_RDONLY:    equ 0
O_WRONLY:    equ 1
O_RDWR:      equ 2
O_CREAT:     equ 64
O_APPEND:    equ 1024
O_DIRECTORY: equ 65536
O_PATH:      equ 2097152
O_TMPFILE:   equ 4259840
    section .bss
    section .text

    global O_RDONLY
    global O_WRONLY
    global O_RDWR
    global O_CREAT
    global O_APPEND
    global O_DIRECTORY
    global O_PATH
    global O_TMPFILE
