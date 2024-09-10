;main
global _start

section .text
_start:
    ; Llamar a la función `hello` del archivo `calculadora.asm`
    extern hello
    call hello

    ; Llamar a la función `hello1` del archivo `conversor.asm`
    extern hello1
    call hello1

    ;Terminar ejecución
    mov rax, 60         ; syscall: exit
    xor edi, edi        ; código de salida: 0
    syscall

section .data
