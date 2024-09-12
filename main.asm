;main
global _main

extern main
extern hello1

section .text
_main:
    ; Llamar a la función `hello` del archivo `calculadora.asm`
    call hello1

    call main

    ; Llamar a la función `hello1` del archivo `conversor.asm`
    

    ;Terminar ejecución
    mov rax, 60         ; syscall: exit
    xor edi, edi        ; código de salida: 0
    syscall

section .data
