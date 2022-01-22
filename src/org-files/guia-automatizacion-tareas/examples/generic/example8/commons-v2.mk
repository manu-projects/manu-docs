# ESTE ES EL MAS NUEVO..!

# make -f commons-v2.mk

DIR_BIN = bin
DIR_SRC = src
DIR_OBJ = obj
SRC = $(wildcard $(DIR_SRC)/*.c)
OBJ = $(SRC:$(DIR_SRC)/%.c=$(DIR_OBJ)/%.o)
BIN = app

.PHONY: all
all: clean bin/app.out

# bin/app.out: obj/list.o obj/string.c
# 	gcc src/list.c -o bin/app.out -L/usr/include -lcommons

# obj/list.o: src/list.c
# 	gcc -c src/list.c -o obj/list.o

# - La función $(notdir listaArchivos) remueve los nombres de los directorios, deja sólo los nombres de los archivos
# - El $(notdir listaArchivos) hace lo opuesto de $(dir listaArchivos)

# imprimir:
# 	@echo SRC: $(SRC)
# 	@echo SRC solo nombres: $(notdir $(SRC))
# 	@echo OBJ: $(OBJ)
# 	@echo OBJ solo nombres: $(notdir $(OBJ))

# OBJ: tiene una lista de todos los objs
$(DIR_BIN)/$(BIN).out: $(OBJ)
	@echo "2) obj to out"
	gcc $^ -o bin/app.out -L/usr/include -lcommons

# - regla de patrón estática, le decimos que lo aplique en todos los obj que queremos
# - con $* obtenemos el valor del % que tenga coincidencias con el patrón (el nombre del archivo, sin la extensión)
# - la orden se ejecuta por cada coincidencia por cada .c (suponiendo que coincide con la lista de OBJ)
$(OBJ): $(DIR_OBJ)/%.o: $(DIR_SRC)/%.c
	@echo "1) .c to .o: dependencias: $^ archivo=$(@F) raiz=$(*)"
	gcc -c $(DIR_SRC)/$*.c -o $(DIR_OBJ)/$*.o

.PHONY: clean
clean:
	@echo borrando archivos
	@-rm -rf bin/*.out
	@-rm -rf obj/*.o
