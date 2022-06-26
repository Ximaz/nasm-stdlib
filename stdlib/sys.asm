BITS 64

__8BITS equ 0xff
__16BITS equ 0xffff
__32BITS equ 0xffffffff
__64BITS equ 0xffffffffffffffff

; --------------------------------------------------------------------------------
; void exit(__EXIT_STATUS status: dil);
;
; Description :
;
; Exit the program and return a status code (dil). The recommanded status code range is [0-127].
; --------------------------------------------------------------------------------
exit:
    mov ax, SYS_EXIT
    syscall
    retn
