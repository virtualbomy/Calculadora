section .data
msg db 'Hello, world!', 0xA ; Mensaje a imprimir (y nueva línea)
msg_len equ $ - msg          ; Longitud del mensaje

section .text
global hello1

hello1:
   


