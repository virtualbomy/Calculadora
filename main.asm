section .text
global _main

extern main

_main:
    ; Llamar a la función main de menu.cpp
    call main

    ; Terminar ejecución
    mov rax, 60         ; syscall: exit
    xor edi, edi        ; código de salida: 0
    syscall
