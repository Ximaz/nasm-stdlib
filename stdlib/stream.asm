BITS 64
default rel
%include "./syscalls_id.asm"
; Flags
_SF_READ_ONLY equ 0
_SF_WRITE_ONLY equ 1
_SF_READ_AND_WRITE equ 2
_SF_CREATE equ 64
_SF_EXCL equ 128
_SF_NOCTTY equ 256
_SF_TRUNC equ 512
_SF_APPEND equ 1024
_SF_NONBLOCK equ 2048
_SF_NDELAY equ 2048
_SF_DSYNC equ 4096
_SF_ASYNC equ 8192
_SF_DIRECT equ 16384
_SF_DIRECTORY equ 65536
_SF_NOFOLLOW equ 131072
_SF_NOATIME equ 262144
_SF_CLOEXEC equ 524288
_SF_SYNC equ 1052672
_SF_PATH equ 2097152
_SF_TMPFILE equ 4259840
_SF_LARGEFILE equ 0

; ERRORS :
_STD_STREAM_ERR_OPEN equ 0xfffffffffffffffe

%macro _STD_STREAM_OPEN 3
    lea rdi, [%1] ; Path's buffer
    mov rax, SYS_OPEN
    mov rsi, %2 ; Flags (_SF_<FLAG>)
    mov rdx, %3 ; Permissions
    syscall
%endmacro

%macro _STD_STREAM_SET_CURSOR_TO 2
    lea rdi, [%1]
    push rax
    mov rax, SYS_LSEEK
    mov rsi, 0
    mov rdx, %2
    syscall
    pop rax
%endmacro

%macro _STD_STREAM_WRITE 2
    lea rdi, [%1]
    mov rsi, %2
    push rax
    _STD_STRLEN rsi
    mov rdx, rax
    mov rax, SYS_WRITE
    syscall
    pop rax
%endmacro

%macro _STD_STREAM_READ 2
    mov rdi, %1
    sub rsp, %2
    mov rax, SYS_READ
    mov rsi, rsp
    mov rdx, %2
    syscall
    add rsp, %2
    pop rax
    lea rax, [rsi]
%endmacro

%macro _STD_STREAM_CREATE 2
    mov rsi, _SF_CREATE+_SF_WRITE_ONLY
    _STD_STREAM_OPEN %1, rsi, %2
%endmacro

%macro _STD_STREAM_CLOSE 1
    push rax
    mov rdi, %1
    mov rax, SYS_CLOSE
    syscall
    pop rax
%endmacro
