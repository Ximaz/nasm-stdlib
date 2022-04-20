BITS 64

; MODES :
O_RDONLY equ 0
O_WRONLY equ 1
O_RDWR equ 2
O_CREAT equ 64
O_APPEND equ 1024
O_DIRECTORY equ 65536
O_PATH equ 2097152
O_TMPFILE equ 4259840

; OTHER :
_FS_EXCL equ 128
_FS_NOCTTY equ 256
_FS_TRUNC equ 512
_FS_NONBLOCK equ 2048
_FS_NDELAY equ 2048
_FS_DSYNC equ 4096
_FS_ASYNC equ 8192
_FS_DIRECT equ 16384
_FS_NOFOLLOW equ 131072
_FS_NOATIME equ 262144
_FS_CLOEXEC equ 524288
_FS_SYNC equ 1052672
_FS_LARGEFILE equ 0
_FS_ERR_OPEN equ 0xfffffffffffffffe

; --------------------------------------------------------------------------------
; (int const file_descriptor: rax) open(char const *path: rdi,
;                                       O_<MODE> const modes: rsi,
;                                       int const unix_octal_permissions: rdx);
; --------------------------------------------------------------------------------
open:
    mov rax, SYS_OPEN
    syscall
    ret

; --------------------------------------------------------------------------------
; void close(int const file_descriptor: rdi);
; --------------------------------------------------------------------------------
close:
    mov rax, SYS_CLOSE
    syscall
    ret

; --------------------------------------------------------------------------------
; void write(int const file_descriptor: rdi, char const *buffer: rsi);
; --------------------------------------------------------------------------------
write:
    call strlen
    mov rdx, rcx
    mov rax, SYS_WRITE
    syscall
    ret

; --------------------------------------------------------------------------------
; (unsigned int const read_bytes: rax) read(char *buffer: rsi,
;                                           int const file_descriptor: rdi,
;                                           unsigned int const length: rdx);
; --------------------------------------------------------------------------------
read:
    mov rax, SYS_READ
    syscall
    ret

; --------------------------------------------------------------------------------
; void seek_to(int const file_descriptor: rdi,
;              unsigned int const position: rdx);
; --------------------------------------------------------------------------------
seek_to:
    mov rax, SYS_LSEEK
    mov rsi, 0
    syscall
    ret
