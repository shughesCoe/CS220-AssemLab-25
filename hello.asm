section .data
    msg db "Hello, World!", 0xa  ; Define the string with a newline (0xa)
    len equ $ - msg             ; Calculate message length

section .text
    global _start               ; Entry point for the linker

_start:
    ; sys_write(stdout, msg, len)
    mov rax, 1                  ; System call number for write (1)
    mov rdi, 1                  ; File descriptor 1 (stdout)
    mov rsi, msg                ; Address of the string
    mov rdx, len                ; Length of the string
    syscall                     ; Invoke the kernel

    ; sys_exit(0)
    mov rax, 60                 ; System call number for exit (60)
    mov rdi, 0                  ; Exit status code 0 (success)
    syscall                     ; Invoke the kernel
