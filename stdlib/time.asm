BITS 64

; --------------------------------------------------------------------------------
; void sleep(__INT ms: rax);
;
; Description :
;
; Pause the program for ms milliseconds (rax).
; --------------------------------------------------------------------------------
sleep:
    push rax
__sleep_count_all_ms:
    xor rax, rax
__sleep_count_one_ms:
    inc rax
    cmp rax, 3600000               ; ~ 1 millisecond
    jne __sleep_count_one_ms
    dec rcx
    cmp rcx, 0
    jne __sleep_count_all_ms

    pop rax
    retn
