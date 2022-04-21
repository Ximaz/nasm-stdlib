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
; (int fd: di) open(char *path: rdi, O_[MODE] mode: rsi, int unix_permissions: dx);
;
; Description :
;
; Open a file using the path buffer (rdi), the mode (rsi) and the unix permissions.
;
; If the O_CREAT mode is not specified, the unix permissions will be ignored.
;
; If an error occured, the fd value's going to be -1 (0xffffffff).
; --------------------------------------------------------------------------------
open:
    mov ax, SYS_OPEN
    syscall
    xor rdi, rdi
    mov di, ax
    retn

; --------------------------------------------------------------------------------
; (int err: rax) close(int fd: di);
;
; Dscription :
;
; Close a file using the fd (di).
;
; If the fd is wrong, the err value is set to -1. If not, err value is set to 0.
; --------------------------------------------------------------------------------
close:
    mov ax, SYS_CLOSE
    syscall
    retn

; --------------------------------------------------------------------------------
; void write(int fd: di, char *buffer: rsi);
; --------------------------------------------------------------------------------
write:
    call strlen
    mov rdx, rcx
    mov ax, SYS_WRITE
    syscall
    retn

; --------------------------------------------------------------------------------
; (unsigned int read_bytes: rax) read(char *buffer: rsi,
;                                     int fd: di,
;                                     unsigned int length: rdx);
; --------------------------------------------------------------------------------
read:
    mov ax, SYS_READ
    syscall
    mov [rsi+rax], byte 0 ; Puts a null byte at the last read byte position.
    retn

SEEK_SET equ 0 ; Sets the cursor to the pointed offset.
SEEK_CUR equ 1 ; Sets the cursor starting from current position to the offset.
SEEK_END equ 2 ; Sets the cursor backwards from the end back to the offset.

; --------------------------------------------------------------------------------
; (int err: rax) lseek(int fd: di,
;                      SEEK_<SET|CUR|END> referer: dl,
;                      int offset: rsi);
; --------------------------------------------------------------------------------
lseek:
    mov ax, SYS_LSEEK
    syscall
    retn
