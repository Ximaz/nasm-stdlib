BITS 64

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

; --------------------------------------------------------------------------------
; void sleep(__INT ms: ecx);
;
; Description :
;
; Pause the program for n milliseconds (ecx).
; --------------------------------------------------------------------------------
sleep:
__sleep_2:
    mov eax, __16BITS
__sleep_1:
    nop
    dec eax
    cmp eax, 0
    jne short __sleep_1
    dec ecx
    cmp ecx, 0
    jnz short __sleep_2
    retn
