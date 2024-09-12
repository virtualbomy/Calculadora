section .data
    hex_chars db "0123456789ABCDEF" ;cadena de caracteres con los dígitos hexadecimales

section .text
global decimal_to_binary
global decimal_to_hex
global decimal_to_octal

; void decimal_to_binary(int num, char* buffer)
decimal_to_binary:
    push rbp
    mov rbp, rsp
    mov eax, edi        ; num
    mov rsi, rsi        ; buffer
    mov rcx, 32         ; contador para 32 bits
    mov rbx, rsi        ; Guardar el inicio del buffer
    
.loop:
    xor rdx, rdx
    shl eax, 1          ; desplaza el bit más significativo a CF
    setc dl             ; establece dl a 1 si CF es 1, 0 en caso contrario
    add dl, '0'         ; convierte a carácter ASCII
    mov [rsi], dl       ; almacena en el buffer
    inc rsi
    loop .loop
    
    mov byte [rsi], 0   ; termina la cadena con null
    ; Invertir la cadena en el buffer
    mov rsi, rbx
    mov rdx, rcx        ; longitud de la cadena en bits
    shr rdx, 1          ; longitud en caracteres (32 bits / 2)
    dec rsi             ; Ajuste para el final del buffer
    mov rbx, rsi        ; Guardar el final del buffer
    
.reverse_loop:
    cmp rsi, rbx
    jae .done
    mov al, [rsi]
    mov ah, [rbx]
    mov [rsi], ah
    mov [rbx], al
    dec rbx
    inc rsi
    jmp .reverse_loop
    
.done:
    pop rbp
    ret

; void decimal_to_hex(int num, char* buffer)
decimal_to_hex:
    push rbp
    mov rbp, rsp
    mov eax, edi        ; num
    mov rsi, rsi        ; buffer
    mov rcx, 8          ; contador para 8 dígitos hexadecimales
    mov rbx, rsi        ; Guardar el inicio del buffer
    
.loop:
    rol eax, 4          ; rota 4 bits a la izquierda
    mov edx, eax
    and edx, 0Fh        ; máscara para obtener el último dígito
    mov dl, [hex_chars + edx]  ; obtiene el carácter hexadecimal
    mov [rsi], dl       ; almacena en el buffer
    inc rsi
    loop .loop
    
    mov byte [rsi], 0   ; termina la cadena con null
    pop rbp
    ret

; void decimal_to_octal(int num, char* buffer)
decimal_to_octal:
    push rbp
    mov rbp, rsp
    mov eax, edi        ; num
    mov rdi, rsi        ; buffer
    xor rcx, rcx        ; contador para dígitos
    
.loop:
    xor rdx, rdx        ; limpair antes de la division
    mov ebx, 8          ; divisor octal
    div ebx             ; dividir eax entre 8, cociente eax y residuo dl
    add dl, '0'         ; convertir residuo a ASCII
    push rdx            ; guardar dígito en la pila
    inc rcx             ; contador de digito +1
    test eax, eax       ; comprobar si cociente es 0
    jnz .loop           ; si no es 0, se repite
    
    ; Quitar los dígitos de la pila
.store:
    pop rdx
    mov [rdi], dl       ; almacenar en buffer
    inc rdi             ; mover puntero una posición hacia adelante
    loop .store         ; repetir por todos los dígitos
    
    mov byte [rdi], 0   
    
    ; Si el buffer está vacío entonces =0
    cmp rdi, rsi        ; comparar posición actual del buffer con la inicial
    jne .done           ; Si son diferentes, se añadieron dígitos
    mov byte [rsi], '0' ; si son iguales =0
    mov byte [rsi + 1], 0 
    
.done:
    pop rbp
    ret ; Regresar al punto de llamada
