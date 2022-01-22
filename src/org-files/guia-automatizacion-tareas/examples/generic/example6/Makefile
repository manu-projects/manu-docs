PROGRAMA = calculadora
CC = gcc
# no interesa si la macro "INCLUDE" se define antes ó después que es usada en otra macro,
# porque se le asigna el valor cuando se ejecute la orden de regla en donde se use,
# y en ese momento ésta se expande
CFLAGS = -I$(INCLUDE)
INCLUDE = ./include

#SRC = calculadora.c operaciones.c lib.c
SRC = $(wildcard *.c) # buscará en el directorio todas las entradas/archivos que tengan como extensión .c
OBJ = $(SRC:.c=.o) # reemplazamos los .c en .o, otra alternativa sería usar la función patsubst de make

# (1) Regla Explícita
# Indicamos a GNU Make como debe construir el objetivo "calculadora"
# 1. Agregamos las dependencias (los archivos que necesita para generar el objetivo)
# 2. Definimos la orden (la sentencia donde compilamos con gcc)
#
# Nota: Esta regla explícita, podría ser implícita porque podriamos borrar la orden "$(CC) -o $@ $^"
# y de igual manera GNU Make sabría como interpretar la regla, y que debe agregar por defecto la orden anterior
$(PROGRAMA): $(OBJ)
	$(CC) -o $@ $^

# (3) Reglas implícitas
# - Son implícitas, porque no le indicamos a GNU Make como construir el objetivo (en este caso los archivos .o)
# es decir no tienen una orden/comando.. Estan formadas por target+dependencias
# - En estas reglas los objetos (.o) son objetivos/target, le agregamos dependencias (en este caso archivos cabecera .h de los que dependen)
# - Las definimos para que si algún archivo de cabecera (.h) se actualiza,
# entonces GNU Make entienda que debe reconstruir los objetivos (en este caso archivos .o) que dependen de esos archivos .h
#
# Ej. si se actualiza operaciones.h, entonces make volverá a construir los objetivos operaciones.o y calculadora.o pero no lib.o
calculadora.o : $(INCLUDE)/operaciones.h
operaciones.o : $(INCLUDE)/operaciones.h $(INCLUDE)/lib.h
lib.o : $(INCLUDE)/lib.h

# --------------------------------------------------

# - Agregamos el @ para que no se imprima el comando en la terminal
# - Usamos el - para que en caso de fallar la instrucción "rm", se siga ejecutando
# (si no lo usamos, fallará porque no exista algún .o ó el binario y no borrará el resto de los archivos)
.PHONY: clean
clean:
	@-rm *.o
	@-rm $(PROGRAMA)

# - Usamos el ; porque para cumplir el objetivo no se requiere dependencias
.PHONY: run
run: ; @./$(PROGRAMA)
