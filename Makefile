# Nombre del ejecutable
TARGET := ejecutable

# Archivos fuente y objetos
ASM_SOURCES := calculadora.asm conversor.asm main.asm
ASM_OBJECTS := $(ASM_SOURCES:.asm=.o)

CPP_SOURCE := menu.cpp
CPP_OBJECT := menu.o

# Regla por defecto
all: $(TARGET)

# Compilar archivos ASM
%.o: %.asm
	nasm -f elf64 $< -o $@

# Compilar y enlazar todo
$(TARGET): $(ASM_OBJECTS) $(CPP_OBJECT)
	g++ $(CPP_SOURCE) $(ASM_OBJECTS) -o $(TARGET)

# Ejecutar el programa
run: all
	./$(TARGET)

# Depurar con gdb
debug: all
	gdb $(TARGET)

# Limpiar los archivos generados
clean:
	rm -f $(ASM_OBJECTS) $(CPP_OBJECT) $(TARGET)

