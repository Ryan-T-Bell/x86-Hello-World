; hello_world.asm
; A simple "Hello, World!" program for Intel Macbook Pro
;
; Author: Ryan Bell

; Run:
; brew install nasm
; nasm -f macho64 -o hello.o hello.asm
; ld -macosx_version_min 10.7.0 -lSystem -o hello hello.o
; ./hello


section .data
    message db "Hello, World!", 0

section .text
    global _start

_start:
    ; write the message to stdout
    mov eax, 0x2000004  ; system call for 'write'
    mov edi, 1         ; file descriptor for stdout
    mov rsi, message   ; message to write
    mov edx, 13        ; message length
    syscall            ; invoke the kernel

    ; exit the program
    mov eax, 0x2000001  ; system call for 'exit'
    xor edi, edi        ; exit status code 0
    syscall             ; invoke the kernel

