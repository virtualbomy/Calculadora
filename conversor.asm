;Conversor
section .text
global hello1

hello1:
    ; Imprime texto
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; file descriptor: stdout
    mov rsi, msg        ; dirección del mensaje
    mov rdx, msg_len    ; longitud del mensaje
    syscall
    ret

section .data
msg db 'Hello, world!', 0xA ; Mensaje a imprimir (y nueva línea)
msg_len equ $ - msg          ; Longitud del mensaje
