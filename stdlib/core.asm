BITS 64

%include "stdlib/types.asm"
%include "stdlib/syscalls_id.asm"
%include "stdlib/string.asm"
%include "stdlib/fs.asm"
%include "stdlib/io.asm"

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
