# Compilador y enlazador
NASM = nasm
LD = ld

# Banderas
NASMFLAGS = -f elf64
LDFLAGS =

# Se define los nombres de los archivos del programa
SOURCES = main.asm calculadora.asm conversor.asm
OBJECTS = $(SOURCES:.asm=.o)
TARGET = programa

# Se ejecuta al utilizar ¨make¨
all: $(TARGET)

# Crea el ejecutable
$(TARGET): $(OBJECTS)
	$(LD) $(LDFLAGS) $(OBJECTS) -o $(TARGET)

# Compila los archivos
%.o: %.asm
	$(NASM) $(NASMFLAGS) $< -o $@

# Limpia los archivos y ejecutable con make clean
clean:
	rm -f $(OBJECTS) $(TARGET)

# Forzar que target `clean` siempre se ejecute
.PHONY: all clean
