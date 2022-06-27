BITS 64

_8BITS equ 0xff
_16BITS equ 0xffff
_32BITS equ 0xffffffff
_64BITS equ 0xffffffffffffffff

; --------------------------------------------------------------------------------
; void exit(_EXIT_STATUS status: dil);
;
; Description :
;
; Exit the program and return a status code (dil). The recommanded status code range is [0-127].
; --------------------------------------------------------------------------------
exit:
    mov ax, SYS_EXIT
    syscall
    retn
