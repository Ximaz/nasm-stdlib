BITS 64

; --------------------------------------------------------------------------------
; void sleep(_INT ms: rax);
;
; Description :
;
; Pause the program for ms milliseconds (rax).
; --------------------------------------------------------------------------------
sleep:
    push rax
_sleep_count_all_ms:
    xor rax, rax
_sleep_count_one_ms:
    inc rax
    cmp rax, 3600000         ; 3.6*10^6 ~ 1 millisecond
    jne _sleep_count_one_ms
    dec rcx
    cmp rcx, 0
    jne _sleep_count_all_ms
    pop rax
    retn
