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
; (__INT fd: di) open(__CHAR *path: rdi, O_[MODE] mode: rsi, __INT unix_permissions: dx);
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
; (__INT err: rax) close(__INT fd: di);
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
; (__SIZE_T written_bytes: rax) write(__INT fd: di, __CHAR *buffer: rsi);
;
; Description :
;
; Write bytes from the buffer (rsi) into a fd (di).
;
; The bytes len is computer using ``strlen`` call.
;
; If an error occured while writting bytes, the written_bytes value is set to -1.
; --------------------------------------------------------------------------------
write:
    call strlen
    mov rdx, rcx
    mov ax, SYS_WRITE
    syscall
    retn

; --------------------------------------------------------------------------------
; (__INT read_bytes: rax) read(__CHAR *buffer: rsi, __INT fd: di, __INT len: rdx);
;
; Description :
;
; Read n bytes (len: rdx) from the fd (di) and store them into the buffer (rsi).
;
; If an error occured while reading bytes, the read_bytes value is set to -1.
; --------------------------------------------------------------------------------
read:
    mov ax, SYS_READ
    syscall
    retn

SEEK_SET equ 0 ; Absolute context.
SEEK_CUR equ 1 ; Relative context.
SEEK_END equ 2 ; EOF context.

; --------------------------------------------------------------------------------
; (__OFF_T err: rax) lseek(__INT fd: di, SEEK_<SET|CUR|END> context: dl, __OFF_T offset: rsi);
;
; Description :
;
; Set the cursor position of an fd (di) according the context which can be :
; - SEEK_SET : starting from 0,
; - SEEK_CUR : starting from current position,
; - SEEK_END : starting from the end going backward.
;
; If an error occured while seeking, the err value is set to -1.
; --------------------------------------------------------------------------------
lseek:
    mov ax, SYS_LSEEK
    syscall
    retn
