BITS 64

%include "stdlib/types.asm"
%include "stdlib/syscalls_id.asm"
%include "stdlib/string.asm"
%include "stdlib/fs.asm"
%include "stdlib/io.asm"

; --------------------------------------------------------------------------------
; void exit(int error_code: rdi);
; --------------------------------------------------------------------------------
exit:
    mov ax, SYS_EXIT
    syscall
    retn
